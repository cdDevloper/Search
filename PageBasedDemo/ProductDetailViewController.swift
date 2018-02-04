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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //Mark: IBAction Methods
    @IBAction func btnBackPress(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}
