//
//  FeedViewController.swift
//  iddog
//
//  Created by Lidia Chou on 11/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var feedViewModel = FeedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        feedViewModel.configureView(self)
        setLayout()
        setDelegates()
    }
    
    func setLayout() {
        searchTextField.layer.borderWidth = 0.5
        searchTextField.layer.cornerRadius = 5
        searchTextField.layer.borderColor = UIColor(hexColor: Constants.Colors.purple).cgColor
        
        searchButton.tintColor = .white
        searchButton.backgroundColor = UIColor(hexColor: Constants.Colors.purple)
        searchButton.layer.cornerRadius = 5
    }
    
    @IBAction func searchButton(_ sender: Any) {
        if let dogBreed = searchTextField.text, dogBreed != "" {
            feedViewModel.searchDogBreed(dogBreed, view: self)
        } else {
            showErrorAlert(title: Constants.ErrorAlerts.titleError,
                           message: Constants.ErrorAlerts.messageEmptyTextField,
                           buttonTitle: Constants.ErrorAlerts.okButton)
        }
        
    }
    
    func showErrorAlert(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Table View
extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "imageCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell",
                                                      for: indexPath) as! ImageCollectionViewCell
        
        return cell
    }
}

// MARK: - TextField setup
extension FeedViewController: UITextFieldDelegate {
    
    func setTextFieldDelegate() {
        searchTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - Navigation settings
extension FeedViewController {
    
    func setNavigationBar() {
        navigationController?.isNavigationBarHidden = false
    }
}
