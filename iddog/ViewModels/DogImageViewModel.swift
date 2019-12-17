//
//  DogImageViewModel.swift
//  iddog
//
//  Created by Lidia Chou on 11/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import Foundation

class DogImageViewModel {
    
    var imageUrl: URL
    var breed: String
    
    var navTitle: String {
        return breed
    }
    var dogImageText: String {
        return "Image of \(breed)"
    }
    
    init(imageUrl: URL,
         breed: String) {
        self.imageUrl = imageUrl
        self.breed = breed
    }
    
    func configureView(_ view: DogImageViewController) {
        view.navigationItem.title = navTitle
        
        setAccessibility(view)
    }
    
    func getDogImageUrl() -> URL {
        return imageUrl
    }
}

// MARK: - Accessibility
extension DogImageViewModel {
    
    func setAccessibility(_ view: DogImageViewController) {
        view.navigationItem.accessibilityLabel = navTitle
        view.navigationItem.accessibilityTraits = Accessibility.Traits.header
        view.navigationItem.leftBarButtonItem?.accessibilityLabel = Accessibility.Labels.back
        
        view.dogImageView.accessibilityLabel = dogImageText
        view.dogImageView.accessibilityTraits = Accessibility.Traits.image
    }
}
