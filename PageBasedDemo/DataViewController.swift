//
//  DataViewController.swift
//  PageBasedDemo
//
//  Created by Bhagwant-MacBook on 01/01/01.
//  Copyright © 2001 CDDevloper. All rights reserved.
//

import UIKit

protocol DataViewControllerDelegate{
    func moveToNextViewController(index:Int)
}

class DataViewController: UIViewController {

    @IBOutlet
    weak var mainTitle: UILabel!
    @IBOutlet
    weak var subTitle:  UILabel!
    
    @IBOutlet
    weak var imgView:   UIImageView!
    
    @IBOutlet
    weak var btnNext:   UIButton!
    
    @IBOutlet weak var pagecontl: UIPageControl!
    var mainTitleData:  String = ""
    var subTitleData:   String = ""
    var imgName:        String = ""
    var btnTitle:       String = ""
    var index:          Int = 0
    
    var delegate:DataViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.mainTitle.text = mainTitleData
        self.subTitle.text  = subTitleData
        self.imgView.image  = UIImage(named: imgName)
        self.btnNext.setTitle(btnTitle, for: .normal)
        
        pagecontl.currentPage = index
        if index == 0{
          self.view.backgroundColor = Color.bussBgColor//UIColor(red: 61.0/255.0, green: 255.0/255.0, blue: 237.0/255.0, alpha: 1.0)
        }else{
            self.view.backgroundColor = Color.offerBgColor
        }
    }

    @IBAction func btnNextPress(_ sender: Any) {
        self.delegate?.moveToNextViewController(index: index)
    }

}

