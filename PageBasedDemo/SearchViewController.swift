//
//  SearchViewController.swift
//  PageBasedDemo
//
//  Created by Jayesh on 2/11/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
  @IBOutlet weak var tblViewStoreList: UITableView!
  @IBOutlet weak var tblViewSearch: UITableView!
  @IBOutlet weak var imgViewAll: UIImageView!
  @IBOutlet weak var imgViewShopName: UIImageView!
  @IBOutlet weak var imgViewContact: UIImageView!
  @IBOutlet weak var imgViewAllCategory: UIImageView!
  @IBOutlet weak var txtSerch: UITextField!
  @IBOutlet weak var viewOption: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.tblViewSearch.isHidden = true
         self.tblViewStoreList.isHidden = true
        viewOption.isHidden = true
    }
    
    //Mark: IBAction Methods
    @IBAction func btnBackPress(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - TableView Delegate and DataSource
extension SearchViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! tableViewCell
        cell.selectionStyle = .none
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       
    }
    
}


// Mark: SelectCityDelegate Method
extension SearchViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5, delay: 0.4, options: .curveEaseOut, animations: {
            self.viewOption.alpha = 1
            self.viewOption.isHidden = false
        }, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//            guard let text = textField.text else { return true }
//            let newLength = text.characters.count + string.characters.count - range.length
//            return newLength <= Value.mobNumberLength
        
        
        return true
    }
}
