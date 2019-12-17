//
//  Accessibility.swift
//  iddog
//
//  Created by Lidia Chou on 16/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import UIKit

public struct Accessibility {
    
    // MARK: - Traits
    struct Traits {
        static let none = UIAccessibilityTraits.none
        static let header = UIAccessibilityTraits.header
        static let image = UIAccessibilityTraits.image
        static let button = UIAccessibilityTraits.button
        static let searchField = UIAccessibilityTraits.searchField
        static let staticText = UIAccessibilityTraits.staticText
        
        static let selected = UIAccessibilityTraits.selected
        static let notEnabled = UIAccessibilityTraits.notEnabled
    }
    
    struct Labels {
        static let back = "Back"
        static let dogImagesCollection = "Dog images collection"
        
        // TextFields
        static let emailTextField = "Login email input"
    }
}
