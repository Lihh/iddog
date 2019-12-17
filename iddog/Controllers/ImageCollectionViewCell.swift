//
//  ImageCollectionViewCell.swift
//  iddog
//
//  Created by Lidia Chou on 11/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dogImageView: UIImageView!
    
    var imageCollectionCellViewModel = ImageCollectionCellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
