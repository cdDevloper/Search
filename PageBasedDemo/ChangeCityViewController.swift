//
//  ChangeCityViewController.swift
//  PageBasedDemo
//
//  Created by Jayesh on 2/4/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

protocol ChangeCityDelegate{
    func changeCity(cityName:String)
}

class ChangeCityViewController: UIViewController {
   @IBOutlet weak var lblSelCity: UILabel!
    var delegate:ChangeCityDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    // MARK: - IB Action Method
    @IBAction func btnProccedPress(_ sender: Any) {
        self.delegate?.changeCity(cityName: lblSelCity.text!)
    }
    
    @IBAction func btnSelectCityPress(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectCityViewController") as! SelectCityViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btnbackPress(_ sender: Any) {
        
    }


}

extension ChangeCityViewController : SelectCityDelegate{
    func selectedCity(cityName: String) {
        lblSelCity.text = cityName
    }
}
