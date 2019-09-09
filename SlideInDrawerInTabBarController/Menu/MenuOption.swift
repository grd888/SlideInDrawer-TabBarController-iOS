//
//  MenuOption.swift
//  Drawer Demo
//
//  Created by Greg Delgado on 9/1/19.
//  Copyright © 2019 Synchrony Telemed. All rights reserved.
//

import Foundation

enum MenuOption: Int {
    
    case profile
    case legal
    case rate
    case settings
    
    var description: String {
        switch self {
        case .profile: return "Profile"
        case .legal: return "Legal"
        case .rate: return "Rate Us"
        case .settings: return "Settings"
        }
    }
    
    var image: String {
        switch self {
        case .profile: return "ic_user"
        case .legal: return "ic_legal"
        case .rate: return "ic_star"
        case .settings: return "ic_settings"
        }
    }
}
