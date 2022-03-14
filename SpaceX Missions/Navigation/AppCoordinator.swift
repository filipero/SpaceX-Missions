//
//  AppCoordinator.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 10/03/22.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    lazy var navigationController: UINavigationController = {
        return UINavigationController()
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = self.rootViewController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator(presenter: navigationController, navigationDelegate: self)
        addChildCoordinator(homeCoordinator)
        homeCoordinator.start()
    }
}

extension AppCoordinator: CoordinatorDelegate {
    func didClose(childCoordinator: Coordinator) {
        removeChildCoordinator(childCoordinator)
    }
}
