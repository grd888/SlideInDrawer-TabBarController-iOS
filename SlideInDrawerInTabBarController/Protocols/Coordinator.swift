//
//  Coordinator.swift
//  SlideInDrawerInTabBarController
//
//  Created by Greg Delgado on 9/9/19.
//  Copyright © 2019 Greg Delgado. All rights reserved.
//

import UIKit

class Coordinator: NSObject, UINavigationControllerDelegate {
    var didFinish: ((Coordinator) -> Void)?
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    func start() {}
    
    func pushCoordinator(_ coordinator: Coordinator) {
        coordinator.didFinish = { [weak self] (coordinator) in
            self?.popCoordinator(coordinator)
        }
        
        coordinator.start()
        
        childCoordinators.append(coordinator)
    }
    
    func popCoordinator(_ coordinator: Coordinator) {
        // Remove Coordinator From Child Coordinators
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
