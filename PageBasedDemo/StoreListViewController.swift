//
//  StoreListViewController.swift
//  PageBasedDemo
//
//  Created by Bhagwant-MacBook on 09/01/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

class StoreListViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    var strTitle = ""
    var currentPage:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = strTitle
        tblView.separatorStyle = .none
        tblView.estimatedRowHeight = 128.0
        tblView.rowHeight = UITableViewAutomaticDimension
    }
    
    //Mark: Custum Methods
    func didTap()
    {
        print(currentPage)
    }
    
    @IBAction func btnSearchPress(_ sender: Any) {
    }
    
    @IBAction func btnSortPress(_ sender: Any) {
    }
    
    @IBAction func btnBackPress(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}


// Mark : UITableViewDeleagte and Datasource Methods
extension StoreListViewController:UITableViewDelegate,UITableViewDataSource{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblCell") as! tableViewCell
        cell.selectionStyle = .none
      //  cell.lblStoreName.text = ""
       // cell.lblStoreAddess.text = ""
        return cell
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "slideCell") as! tableViewCell
//       
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StoreDetailViewController") as! StoreDetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

