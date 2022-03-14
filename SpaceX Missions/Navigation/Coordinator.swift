//
//  Coordinator.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 10/03/22.
//

import Foundation

/// The Coordinator protocol
public protocol Coordinator: AnyObject {

  /// The array containing any child Coordinator
  var childCoordinators: [Coordinator] { get set }

  /// Start func
  func start()
}

public extension Coordinator {

  /// Add a child Coordinator to the parent
  @discardableResult func addChildCoordinator(_ childCoordinator: Coordinator) -> Coordinator {
    self.childCoordinators.append(childCoordinator)
    return childCoordinator
  }

  /// Remove a child Coordinator from the parent
  @discardableResult func removeChildCoordinator(_ childCoordinator: Coordinator) -> Coordinator {
    self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    return childCoordinator
  }
}

public protocol CoordinatorDelegate: AnyObject {
  func didClose(childCoordinator: Coordinator)
}
