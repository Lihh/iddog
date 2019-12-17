//
//  ImageCollectionCellViewModel.swift
//  iddog
//
//  Created by Lidia Chou on 17/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import Foundation
import UIKit

class ImageCollectionCellViewModel {
    
    // MARK: - Accessibility
    func setAccessibility(_ view: ImageCollectionViewCell, dogBreed: String) {
        view.dogImageView.accessibilityLabel = "\(dogBreed) picture"
        view.dogImageView.accessibilityTraits = Accessibility.Traits.image
    }
}
