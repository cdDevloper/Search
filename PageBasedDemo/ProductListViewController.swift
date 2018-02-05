//
//  ProductListViewController.swift
//  PageBasedDemo
//
//  Created by Jayesh on 2/5/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    var strTitle = ""
    var currentPage:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.separatorStyle = .none
    }
    
    //Mark: IBAction Methods
    @IBAction func btnBackPress(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}


// Mark : UITableViewDeleagte and Datasource Methods
extension ProductListViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "productListCell") as! tableViewCell
            cell.lblProductName.text = "Product " + " \(indexPath.row)"
            cell.imgProduct.image    = UIImage(named: "")
            cell.lblActualRate.text = "₹2000"
            cell.lblDiscountRate.text = "₹3000"
            cell.selectionStyle = .none
        
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
        vc.strTitle = "Product" + " \(indexPath.row)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
