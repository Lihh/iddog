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
    
    init(imageUrl: URL,
         breed: String) {
        self.imageUrl = imageUrl
        self.breed = breed
    }
    
    func configureView(_ view: DogImageViewController) {
        view.navigationItem.title = navTitle
    }
    
    func getDogImageUrl() -> URL {
        return imageUrl
    }
}
