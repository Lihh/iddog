//
//  FeedViewModel.swift
//  iddog
//
//  Created by Lidia Chou on 10/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import Foundation
import UIKit

class FeedViewModel {
    
    var navTitle: String {
        return "Dog Breeds"
    }
    var descriptionText: String {
        return "Want to see some dog pictures? \n Search for a dog breed in the field below"
    }
    var textFieldPlaceholder: String {
        return "Type a dog breed (i.e: husky, labrador, pug, hound)"
    }
    var searchButtonText: String {
        return "Search"
    }
    var dogImagesUrl = [URL]()
    var dogBreedName = ""
    
    func configureView(_ view: FeedViewController) {
        view.navigationItem.title = navTitle
        view.descriptionLabel.text = descriptionText
        view.searchTextField.placeholder = textFieldPlaceholder
        view.searchButton.setTitle(searchButtonText, for: .normal)
    }
    
    func searchDogBreed(_ dogBreed: String, view: FeedViewController) {
        guard let token = LocalStorage().getUserDefaultValue(key: Constants.Keys.token) else { return }
        resetSearch(view: view)
        APIClient.getFeed(token: token as! String, dogBreed: dogBreed.lowercased()) { (dogBreedObject, error) in
            if let dogBreedObject = dogBreedObject {
                self.dogBreedName = dogBreed
                self.getImagesUrlFromList(dogBreedObject.list)
                view.updateCollectionView()
            } else {
                view.showErrorAlert(title: Constants.ErrorAlerts.titleSorry,
                                    message: Constants.ErrorAlerts.messageDogBreedNotFound,
                                    buttonTitle: Constants.ErrorAlerts.okButton)
            }
        }
    }
    
    func getImagesUrlFromList(_ list: [String]) {
        for string in list {
            if let url = URL(string: string) {
                self.dogImagesUrl.append(url)
            }
        }
    }
    
    func resetSearch(view: FeedViewController) {
        dogBreedName = ""
        dogImagesUrl = []
        view.updateCollectionView()
        
    }
}

// MARK: - Set collection view
extension FeedViewModel {
    
    func getNumberOfSections() -> Int{
        return 1
    }
    
    func getNumberOfItens() -> Int {
        return dogImagesUrl.count
    }
    
    func getImageURL(index: Int) -> URL {
        return dogImagesUrl[index]
    }
}

// MARK: - Navigation
extension FeedViewModel {
    
    func goToDogImageView(_ view: FeedViewController, index: Int) {
        let imageUrl = dogImagesUrl[index]
        let vc = DogImageViewController(dogImageViewModel: DogImageViewModel(imageUrl: imageUrl, breed: dogBreedName))
        
        view.goToDogImageView(vc)
    }
}
