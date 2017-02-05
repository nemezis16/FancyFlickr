//
//  ImageGridCollectionViewCell.swift
//  FancyFlickr
//
//  Created by Roman Osadchuk on 2/6/17.
//  Copyright © 2017 Osadchuk. All rights reserved.
//

import UIKit

class ImageGridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gridImageView: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()
        
        gridImageView.image = UIImage()
    }
    
}
