//
//  ProductDetailViewController.swift
//  PageBasedDemo
//
//  Created by Jayesh on 2/5/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrductName: UILabel!
    @IBOutlet weak var lblActualRate: UILabel!
    @IBOutlet weak var lblDiscountRate: UILabel!
    @IBOutlet weak var lblOfferDate: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblStockCount: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    
    
    //PopOutLet
    @IBOutlet weak var lblShopName: UILabel!
    @IBOutlet weak var lblShopAddress: UILabel!
    @IBOutlet weak var lblShopNumber: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var viewShopInfo: UIView!
   
    
    var strTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       hideShopInfoPopup()
    }
    
    
    func hideShopInfoPopup(){
        viewShopInfo.isHidden = true
        btnBack.isHidden = true
    }
    
    func showShopInfoPopup(){
        viewShopInfo.isHidden = false
        btnBack.isHidden = false
    }

    //Mark: IBAction Methods
    @IBAction func btnBackPress(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnShopInfoPress(_ sender: Any) {
        showShopInfoPopup()
    }
    
    
    @IBAction func btnOKPress(_ sender: Any) {
        hideShopInfoPopup()
    }
    
    
    @IBAction func btnBookNowPress(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookOrderViewController") as! BookOrderViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
