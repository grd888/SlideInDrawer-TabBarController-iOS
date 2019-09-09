//
//  MenuOptionPresenting.swift
//  SlideInDrawerInTabBarController
//
//  Created by Greg Delgado on 9/10/19.
//  Copyright © 2019 Greg Delgado. All rights reserved.
//

import UIKit

protocol MenuOptionPresenting {
    func handleMenuOption(_ menuOption: MenuOption?)
}

extension MenuOptionPresenting where Self: Coordinator {
    func handleMenuOption(_ menuOption: MenuOption?) {
        guard let menuOption = menuOption else { return }
        switch menuOption {
        case .settings:
            presentSettings()
        default:
            break
        }
    }
    
    func presentSettings() {
        let vc = SettingsViewController()
        vc.didFinish = { [weak self] in
            self?.navigationController?.dismiss(animated: true, completion: nil)
        }
        navigationController?.present(UINavigationController(rootViewController: vc), animated: true)
    }
}
