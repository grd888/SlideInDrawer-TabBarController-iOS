//
//  HomeCoordinator.swift
//  SlideInDrawerInTabBarController
//
//  Created by Greg Delgado on 9/9/19.
//  Copyright © 2019 Greg Delgado. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator, MenuOptionPresenting {
    
    var rootViewController: UIViewController {
        return navigationController!
    }
    
    init(viewController: MenuPresentingViewController) {
        super.init()
 
        viewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "ic_star"), selectedImage: nil)
        viewController.didDismissMenuWithMenuOption = { [weak self] menuOption in
            self?.handleMenuOption(menuOption)
        }
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController?.delegate = self
    }
    
    override func start() {
        

    }

}
