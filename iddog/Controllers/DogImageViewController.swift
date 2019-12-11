//
//  DogImageViewController.swift
//  iddog
//
//  Created by Lidia Chou on 11/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import UIKit
import SDWebImage

class DogImageViewController: UIViewController {
    
    @IBOutlet weak var dogImageView: UIImageView!

    var dogImageViewModel: DogImageViewModel
    
    init(dogImageViewModel: DogImageViewModel) {
        self.dogImageViewModel = dogImageViewModel
        super.init(nibName: "DogImageViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogImageViewModel.configureView(self)
        setDogImage()
    }
    
    func setDogImage() {
        let dogImageUrl = dogImageViewModel.getDogImageUrl()
        let placeholderImage = UIImage(named: "PlaceholderPaw")
        dogImageView.sd_setImage(with: dogImageUrl,
                                 placeholderImage: placeholderImage)
    }
}

// MARK: - Navigation setup
extension DogImageViewController {
    
    func setNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = UIColor(hexColor: Constants.Colors.purple)
    }
}
