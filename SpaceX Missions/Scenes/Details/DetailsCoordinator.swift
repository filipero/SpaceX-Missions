//
//  DetailsCoordinator.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 14/03/22.
//

import UIKit

final class DetailsCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    private let presenter: UINavigationController
    private weak var navigationDelegate: CoordinatorDelegate?
    private let launch: Launch
    
    init(launch: Launch,
         presenter: UINavigationController,
         navigationDelegate: CoordinatorDelegate? = nil) {
        self.launch = launch
        self.presenter = presenter
        self.navigationDelegate = navigationDelegate
    }
    
    // MARK: - Functions
    func start() {
        let detailsViewModel = DetailsViewModel(launch: launch,
                                                navigationDelegate: self)
        let detailsViewController = DetailsViewController(viewModel: detailsViewModel)
        presenter.pushViewController(detailsViewController, animated: true)
    }
}
extension DetailsCoordinator: CoordinatorDelegate {
    func didClose(childCoordinator: Coordinator) {
      removeChildCoordinator(childCoordinator)
    }
}

extension DetailsCoordinator: DetailsNavigationDelegate { }
