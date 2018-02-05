//
//  SubCategoryViewController.swift
//  PageBasedDemo
//
//  Created by Bhagwant-MacBook on 07/01/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

class SubCategoryViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    var strTitle = ""
    var currentPage:Int = 0
    
    var flgViewController = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = strTitle
        tblView.separatorStyle = .none
        
    }
    
    //Mark: Custum Methods
    func didTap()
    {
        print(currentPage)
    }

     //Mark: IBAction Methods
    @IBAction func btnSearchPress(_ sender: Any) {
    }
    
    @IBAction func btnSortPress(_ sender: Any) {
    }
    
    @IBAction func btnBackPress(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

// Mark : UITableViewDeleagte and Datasource Methods
extension SubCategoryViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if flgViewController == "offer"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "OfferMainCell") as! OfferMainTblCell
            cell.selectionStyle = .none
            cell.lblCatNam.text = "Product " + " \(indexPath.row)"
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tblCell") as! tableViewCell
            cell.lblSubCatName.text = "Subcategory" + " \(indexPath.row)"
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "slideCell") as! tableViewCell
       
        // cell.imgSlideView.layer.borderColor = color.ImgborderCoor.cgColor
        cell.imgSlideView.layer.borderWidth = 1
        cell.imgSlideView.setImageInputs([ImageSource(image: UIImage(named: "img1.png")!),
                                          ImageSource(image: UIImage(named: "img2.JPG")!),ImageSource(image: UIImage(named: "img3.jpg")!)])
        cell.imgSlideView.backgroundColor = UIColor.white
        cell.imgSlideView.slideshowInterval = 5.0
        cell.imgSlideView.pageControlPosition = PageControlPosition.insideScrollView
        cell.imgSlideView.pageControl.currentPageIndicatorTintColor = UIColor.blue
        cell.imgSlideView.pageControl.pageIndicatorTintColor = UIColor.white
        cell.imgSlideView.contentScaleMode = UIViewContentMode.scaleAspectFill
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        
        
        cell.imgSlideView.activityIndicator = DefaultActivityIndicator()
        
        cell.imgSlideView.currentPageChanged = { page in
            self.currentPage = page
            print("current page:", page)
        }
        
        // try out other sources such as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTap))
        cell.imgSlideView.addGestureRecognizer(recognizer)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if flgViewController == "offer"{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductListViewController") as! ProductListViewController
            vc.strTitle = "Product" + " \(indexPath.row)"
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "StoreListViewController") as! StoreListViewController
            vc.strTitle = "Subcategory" + " \(indexPath.row)"
            self.navigationController?.pushViewController(vc, animated: true)
        }
       
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    
}
