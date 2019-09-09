//
//  ContactsViewController.swift
//  SlideInDrawerInTabBarController
//
//  Created by Greg Delgado on 9/9/19.
//  Copyright © 2019 Greg Delgado. All rights reserved.
//

import UIKit

class ContactsViewController: MenuPresentingViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        navigationItem.title = "Contacts"
        
        view.backgroundColor = UIColor.cyan
    }
}
