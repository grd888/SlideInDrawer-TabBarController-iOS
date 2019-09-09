//
//  MenuPresentingViewcontroller.swift
//  SlideIn Drawer
//
//  Created by Greg Delgado on 9/9/19.
//  Copyright © 2019 Synchrony Telemed. All rights reserved.
//

import UIKit

class MenuPresentingViewController: UIViewController {
    
    let transition = SlideInTransition()
    
    var didDismissMenuWithMenuOption: ((MenuOption?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuBarButton()
    }
    
    func setupMenuBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_menu"), style: .plain, target: self, action: #selector(toggleMenu))
    }
    
    @objc func toggleMenu() {
        let menuViewController = MenuViewController()
        menuViewController.delegate = self
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
        tabBarController?.tabBar.isHidden = true
    }
    
    func dismissMenu(withMenuOption menuOption: MenuOption?) {
        dismiss(animated: true) {
            self.tabBarController?.tabBar.isHidden = false
            self.didDismissMenuWithMenuOption?(menuOption)
        }
    }
}

extension MenuPresentingViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

extension MenuPresentingViewController: MenuViewControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        dismissMenu(withMenuOption: menuOption)
    }
}
