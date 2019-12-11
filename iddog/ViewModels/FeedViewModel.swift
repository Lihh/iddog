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
    var descriptionText: String {
        return "Want to see some dog pictures? \n Search for a dog breed below"
    }
    var textFieldPlaceholder: String {
        return "Dog breed (i.e: husky, labrador, pug, hound)"
    }
    var searchButtonText: String {
        return "Search"
    }
    
    func configureView(_ view: FeedViewController) {
        view.navigationItem.title = navTitle
        view.descriptionLabel.text = descriptionText
        view.searchTextField.placeholder = textFieldPlaceholder
        view.searchButton.setTitle(searchButtonText, for: .normal)
    }
    
    func searchDogBreed(_ dogBreed: String, view: FeedViewController) {
        guard let token = LocalStorage().getUserDefaultValue(key: Constants.Keys.token) else { return }
        APIClient.getFeed(token: token as! String, dogBreed: dogBreed.lowercased()) { (dogBreed, error) in
            if let dogBreed = dogBreed {
                print(dogBreed)
            } else {
                view.showErrorAlert(title: Constants.ErrorAlerts.titleSorry,
                                    message: Constants.ErrorAlerts.messageDogBreedNotFound,
                                    buttonTitle: Constants.ErrorAlerts.okButton)
            }
        }
    }
}

// MARK: - Set table view
extension FeedViewModel {
    
}
