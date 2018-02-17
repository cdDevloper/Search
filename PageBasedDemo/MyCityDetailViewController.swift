//
//  MyCityDetailViewController.swift
//  PageBasedDemo
//
//  Created by Jayesh on 2/17/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

class MyCityDetailViewController: UIViewController {
    var arrMenuStr:[String] = ["My City Info","Nearby","City News","Medical News Bulletin","Train Time Table"]
    @IBOutlet var slideView: UIView!
    @IBOutlet var tblView: UITableView!
    @IBOutlet var lblMenuCity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Hide SlideMenu
        menuHide()
        
        //Table View Setting
        tblView.estimatedRowHeight = 45.0
        tblView.separatorStyle = .none
    }

    //Mark: Custum Methods
    
    func menuOpen()
    {
        self.slideView.isHidden = false
        self.view.endEditing(true)
        self.view.bringSubview(toFront: slideView)
        let transition: CATransition = CATransition()
        let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.duration = 0.25
        transition.timingFunction = timeFunc
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.slideView.layer.add(transition, forKey: kCATransition)
    }
    
    func menuHide()
    {
        self.slideView.isHidden = true
    }
    
    
    //Mark: Custum Methods

    @IBAction func btnMenuPress(_ sender: Any) {
        self.menuOpen()
    }
    
    @IBAction func btnbHideMenu(_ sender: Any){
        self.menuHide()
    }
    
    @IBAction func btnBackPress(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
    
    

}


// MARK: - TableView Delegate and DataSource
extension MyCityDetailViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! tableViewCell
        cell.selectionStyle = .none
        cell.lblMenuName.text = arrMenuStr[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        menuHide()
    }
    
}
