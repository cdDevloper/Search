//
//  InfoViewController.swift
//  PageBasedDemo
//
//  Created by Jayesh on 2/8/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
 @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

// Mark : UITableViewDeleagte and Datasource Methods
extension InfoViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! tableViewCell
        cell.selectionStyle = .none
        cell.lblSubCatName.text = "Info  " + " \(indexPath.row)"
        //cell.imgSubCat.image
        return cell
        
    }
    
}
