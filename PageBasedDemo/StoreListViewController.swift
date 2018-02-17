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
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnSort: UIButton!
    @IBOutlet weak var btnNear: UIButton!
    
    @IBOutlet weak var txtSerach: UITextField!
    @IBOutlet weak var imgClear: UIImageView!

    
    var strTitle = ""
    var currentPage:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitle.text = strTitle
        tblView.separatorStyle = .none
        tblView.estimatedRowHeight = 176.0
        tblView.rowHeight = UITableViewAutomaticDimension
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleClearTap(_:)))
        
        imgClear.addGestureRecognizer(tapGesture)
        imgClear.isUserInteractionEnabled = true
        
        showTabOptions()

    }
    
    
    
    // MARK: Custum Methods
    func didTap()
    {
        print(currentPage)
    }
    
   
    func imgMapPress(_ sender:UITapGestureRecognizer)
    {
        
        print("MAP Press==\(sender.view!.tag)")
    }
    
    func imgDetailPress(_ sender:UITapGestureRecognizer)
    {
        print("Detail Press==\(sender.view!.tag)")

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StoreDetailViewController") as! StoreDetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
    func imgCallPress(_ sender:UITapGestureRecognizer)
    {
        print("Call Press==\(sender.view!.tag)")
    }
    
    
    // function which is triggered when handleTap is called
     func handleClearTap(_ sender: UITapGestureRecognizer) {
       if txtSerach.text == ""{
        showTabOptions()
       }else{
          txtSerach.text = ""
        }
    }
    
    func hideTabOption(){
        btnBack.isHidden = true
        btnSearch.isHidden = true
        btnNear.isHidden = true
        lblTitle.isHidden = true
        
        txtSerach.isHidden = false
        imgClear.isHidden  = false
        txtSerach.becomeFirstResponder()
    }
    
    func showTabOptions(){
        btnBack.isHidden = false
        btnSearch.isHidden = false
        btnNear.isHidden = false
        lblTitle.isHidden = false
        
        txtSerach.isHidden = true
        imgClear.isHidden  = true
        txtSerach.resignFirstResponder()
    }
    
    // MARK: IBAction Methods
    @IBAction func btnSearchPress(_ sender: Any) {
         hideTabOption()
    }
    
    @IBAction func btnSortPress(_ sender: Any) {
    }
    
    @IBAction func btnBackPress(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func btnNearPress(_ sender: Any) {
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
      
        //Add Action on Image Map
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imgMapPress(_:)))
        cell.imgMap.addGestureRecognizer(tapGesture)
        cell.imgMap.isUserInteractionEnabled = true
        cell.imgMap.tag = indexPath.row
        //Add Action on Image Detail
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.imgDetailPress(_:)))
        cell.imgDetail.addGestureRecognizer(tapGesture1)
        cell.imgDetail.isUserInteractionEnabled = true
        cell.imgDetail.tag = indexPath.row
        
        //Add Action on Image Map
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(self.imgCallPress(_:)))
        cell.imgCall.addGestureRecognizer(tapGesture2)
        cell.imgCall.isUserInteractionEnabled = true
        cell.imgCall.tag = indexPath.row
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
    
}

