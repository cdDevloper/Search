//
//  MainTypeCollectionViewCell.swift
//  imgSlideViewDemo
//
//  Created by Bhagwant-MacBook on 05/01/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

class MainTypeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblMainType: UILabel!
    @IBOutlet weak var viewOfBkLblBMainType: UIView!
    @IBOutlet weak var imgViewMainType: UIImageView!
}

extension UIView {

        func cardView() {
        layer.cornerRadius = 2
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 2)
        
        layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5);
        layer.shadowOpacity = 1
        layer.shadowPath = shadowPath.cgPath
    }
    
}
