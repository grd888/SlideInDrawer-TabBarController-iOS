//
//  MainCoordinator.swift
//  SlideInDrawerInTabBarController
//
//  Created by Greg Delgado on 9/9/19.
//  Copyright © 2019 Greg Delgado. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var rootViewController: UIViewController {
        return tabBarController
    }
    
    private let tabBarController = UITabBarController()
    
    // MARK: - Initialization
    
    override init() {
        super.init()
        
        let homeCoordinator = HomeCoordinator(viewController: HomeViewController())
        let contactsCoordinator = ContactsCoordinator(viewController: ContactsViewController())
        
        tabBarController.viewControllers = [
            homeCoordinator.rootViewController,
            contactsCoordinator.rootViewController
        ]
        
        childCoordinators.append(homeCoordinator)
        childCoordinators.append(contactsCoordinator)
    }
    
    // MARK: - Overrides
    
    override func start() {
        tabBarController.selectedIndex = 0
        childCoordinators.forEach { (childCoordinator) in
            // Start Child Coordinator
            childCoordinator.start()
        }
    }
}
