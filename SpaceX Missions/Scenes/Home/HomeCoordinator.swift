//
//  HomeCoordinator.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 10/03/22.
//

import UIKit

final class HomeCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    private let presenter: UINavigationController
    private weak var navigationDelegate: CoordinatorDelegate?
    
    init(presenter: UINavigationController,
         navigationDelegate: CoordinatorDelegate? = nil) {
        self.presenter = presenter
        self.navigationDelegate = navigationDelegate
    }
    
    // MARK: - Functions
    func start() {
        let homeViewModel = HomeViewModel(navigationDelegate: self)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        presenter.pushViewController(homeViewController, animated: true)
    }
}

extension HomeCoordinator: HomeNavigationDelegate {
    func goToDetailsScreen(launch: Launch) {
        let detailsCoordinator: DetailsCoordinator = DetailsCoordinator(launch: launch,
                                                                        presenter: presenter,
                                                                        navigationDelegate: self)
        addChildCoordinator(detailsCoordinator)
        detailsCoordinator.start()
    }
}

extension HomeCoordinator: CoordinatorDelegate {
    func didClose(childCoordinator: Coordinator) {
      removeChildCoordinator(childCoordinator)
    }
}
