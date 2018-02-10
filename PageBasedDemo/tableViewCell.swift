//
//  tableViewCell.swift
//  PageBasedDemo
//
//  Created by Bhagwant-MacBook on 07/01/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

class tableViewCell: UITableViewCell {
    @IBOutlet weak var lblCityName: UILabel!

    @IBOutlet weak var imgSubCat: UIImageView!
    @IBOutlet weak var lblSubCatName: UILabel!
    
    @IBOutlet weak var imgSlideView: ImageSlideshow!
    
    
    
    @IBOutlet weak var imgCall: UIImageView!
    @IBOutlet weak var imgMap: UIImageView!
    @IBOutlet weak var imgDetail: UIImageView!
    
    @IBOutlet weak var lblStoreAddess: UILabel!
    @IBOutlet weak var lblStoreCat: UILabel!
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var lblMobNum: UILabel!
    
    //ProductListCell
    @IBOutlet weak var imgProduct: UIImageView!
    
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductDetail: UILabel!
    @IBOutlet weak var lblActualRate: UILabel!
    @IBOutlet weak var lblDiscountRate: UILabel!
    
    //menuCell
    @IBOutlet weak var imgMenuCell: UIImageView!
    
    @IBOutlet weak var lblMenuName: UILabel!
    
    //@IBOutlet weak var imgStore: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


class OfferMainTblCell: UITableViewCell {
    @IBOutlet weak var imgCat: UIImageView!
    @IBOutlet weak var lblCatNam: UILabel!
}
