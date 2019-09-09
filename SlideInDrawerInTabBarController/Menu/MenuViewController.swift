//
//  MenuViewController.swift
//  Drawer Demo
//
//  Created by Greg Delgado on 8/30/19.
//  Copyright © 2019 Synchrony Telemed. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate: class {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?)
}

class MenuViewController: UIViewController {
    
    weak var delegate: MenuViewControllerDelegate?
    
    var tableView: UITableView!
    let cellIdentifier = "MenuOptionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        
    }
    
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.backgroundColor = .gray
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MenuOptionCell
        let menuOption = MenuOption(rawValue: indexPath.row)!
        cell.iconImageView.image = UIImage(named: menuOption.image)?.withRenderingMode(.alwaysTemplate)
        cell.descriptionLabel.text = menuOption.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let menuOption = MenuOption(rawValue: indexPath.row)!
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
}
