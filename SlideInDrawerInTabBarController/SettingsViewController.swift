//
//  SettingsViewController.swift
//  SlideInDrawerInTabBarController
//
//  Created by Greg Delgado on 9/10/19.
//  Copyright © 2019 Greg Delgado. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    var didFinish: (() -> Void)?
    
    func setupUI() {
        navigationItem.title = "Settings"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_close"), style: .plain, target: self, action: #selector(dismissView))
        view.backgroundColor = UIColor.red
        
    }
    
    @objc func dismissView() {
        didFinish?()
    }
    
}
