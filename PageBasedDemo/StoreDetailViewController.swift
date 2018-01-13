//
//  StoreDetailViewController.swift
//  PageBasedDemo
//
//  Created by Bhagwant-MacBook on 10/01/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

class StoreDetailViewController: UIViewController {

    @IBOutlet weak var imgStore: UIImageView!
    @IBOutlet weak var lbltofindy: UILabel!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblStroeName: UILabel!
    @IBOutlet weak var lblStroeSubName: UILabel!
    @IBOutlet weak var lblStroeAddress: UILabel!
    @IBOutlet weak var lblStroeType: UILabel!
    var pageMenu : CAPSPageMenu?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       createPageMenu()
    }
    
    
    func getHeight()-> CGFloat {
        var height = lblStroeType.text?.height(withConstrainedWidth:self.view.frame.size.width - 20, font:UIFont(name: "Futura-Medium", size: 13.0 )!)
        height = height! + (lblStroeName.text?.height(withConstrainedWidth:self.view.frame.size.width - 144, font:UIFont(name: "Futura-Medium", size: 13.0 )!))!
        height  =  height! + (lblStroeSubName.text?.height(withConstrainedWidth:self.view.frame.size.width - 144, font:UIFont(name: "Futura-Medium", size: 13.0 )!))!
        
        height  =  height! + (lblStroeAddress.text?.height(withConstrainedWidth:self.view.frame.size.width - 144, font:UIFont(name: "Futura-Medium", size: 13.0 )!))!
        
        height  = height! + 166.5
        return height!
    }
    func createPageMenu(){
              
        
        var viewController : [UIViewController] = []
        let arrTitle = ["Videos","Images","Friend","Web"]
        for i in 0...3
        {
                let storeCntrl  = self.storyboard?.instantiateViewController(withIdentifier: "VideoListViewController") as! VideoListViewController
                 storeCntrl.title = arrTitle[i]
            
                viewController.append(storeCntrl)
            
        }
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        //.menuItemFont(UIFont(name: fontAndSize.menuItemFont, size: fontAndSize.menuItemFontSize)!),
        
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor(red: 255.0/255.0, green: 20.0/255.0, blue: 147.0/255.0, alpha: 1.0)),
            .viewBackgroundColor(UIColor.clear),.unselectedMenuItemLabelColor(UIColor.darkGray),.selectedMenuItemLabelColor(UIColor.white),
            .selectionIndicatorColor(UIColor(red: 0.0/255.0, green: 206.0/255.0, blue: 209.0/255.0, alpha: 1.0)),
            .menuHeight(40.0),
            .menuItemWidth(self.view.frame.size.width/4),
            .centerMenuItems(true),
            .enableHorizontalBounce(false)]
       
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: viewController, frame:CGRect(x: 0.0, y: self.getHeight(), width: self.view.frame.width, height: self.view.frame.height - self.getHeight()), pageMenuOptions: parameters)
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
    }

    @IBAction func btnBackPress(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}

