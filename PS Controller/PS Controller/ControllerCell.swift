//
//  ControllerCell.swift
//  PS Controller
//
//  Created by Görkem Gültekin on 3.05.2021.
//

import UIKit

class ControllerCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    func configure(image:UIImage?) {
        imageView.image = image
    }

}
