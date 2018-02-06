//
//  BookOrderViewController.swift
//  PageBasedDemo
//
//  Created by Jayesh on 2/6/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

class BookOrderViewController: UIViewController {
    
    @IBOutlet weak var lblProductName: UILabel!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddrss: UITextField!
    @IBOutlet weak var txtPincode: UITextField!
    @IBOutlet weak var txtContactNum: UITextField!
    @IBOutlet weak var txtEmailID: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- IBAction Method
    
    @IBAction func btnSubmitPress(_ sender: Any) {
        
        
    }
    
    @IBAction func btnBackPress(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }

}
