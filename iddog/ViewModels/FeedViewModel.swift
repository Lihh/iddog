//
//  FeedViewModel.swift
//  iddog
//
//  Created by Lidia Chou on 10/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import Foundation

class FeedViewModel {
    
    var navTitle: String {
        return "Dog Breeds"
    }
    var textFieldPlaceholder: String {
        return "Search for a dog breed"
    }
    var searchButtonText: String {
        return "Search"
    }
    
    func configureView(_ view: FeedViewController) {
        view.navigationItem.title = navTitle
        
        view.searchTextField.placeholder = textFieldPlaceholder
        
        view.searchButton.setTitle(searchButtonText, for: .normal)
    }
    
    func searchDogBreed(_ dogBreed: String?) {
        guard let dogBreed = dogBreed else { return }
        guard let token = LocalStorage().getUserDefaultValue(key: Constants.Keys.token) else { return }
        APIClient.getFeed(token: token as! String, dogBreed: dogBreed) { (dogBreed, error) in
            if let dogBreed = dogBreed {
                print(dogBreed)
            }
        }
    }
}

// MARK: - Set table view
extension FeedViewModel {
    
}
