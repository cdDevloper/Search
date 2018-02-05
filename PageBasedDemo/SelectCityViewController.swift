//
//  SelectCityViewController.swift
//  PageBasedDemo
//
//  Created by Bhagwant-MacBook on 07/01/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

protocol SelectCityDelegate{
    func selectedCity(cityName:String)
}

class SelectCityViewController: UIViewController {

    var delegate:SelectCityDelegate?
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var txtSearch: UITextField!
    var arrCity = ["Solapur","Gulbarg","Hubali","Kholapur","Sangli-Miraj","Parli-Vajinath","Nanded","Satara","Osmanabad","Pune","Munbai","Barshi"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.separatorStyle = .none
    }
    
    @IBAction func btnClosePress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// Mark : UITableViewDeleagte and Datasource Methods
extension SelectCityViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell") as! tableViewCell
        cell.lblCityName.text = arrCity[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.delegate?.selectedCity(cityName: self.arrCity[indexPath.row])
            self.dismiss(animated: true, completion: nil)
        }
    }

}
