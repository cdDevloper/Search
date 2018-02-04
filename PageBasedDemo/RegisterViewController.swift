//
//  RegisterViewController.swift
//  PageBasedDemo
//
//  Created by Bhagwant-MacBook on 01/01/01.
//  Copyright © 2001 CDDevloper. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtMobNum: UITextField!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var ttMail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var btnCity: UIButton!
    
    @IBOutlet weak var imgGif: UIImageView!
    @IBOutlet weak var imgCheckUncheck: UIImageView!
    
    @IBOutlet weak var viewUnderScroll: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtMobNum.setLeftIcon("phonecall.png")
        ttMail.setLeftIcon("mail.png")
        txtName.setLeftIcon("user.png")
        
        btnCity.backgroundColor = .white
        btnCity.layer.cornerRadius = 5
        btnCity.layer.borderWidth = 1
        btnCity.layer.borderColor = UIColor.white.cgColor
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    

    @IBAction func btnSelCityPress(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectCityViewController") as! SelectCityViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.delegate = self
       self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func btnTermsAndConditionPress(_ sender: Any) {
        imgCheckUncheck.image = UIImage(named:"check.png")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TermCondViewController") as! TermCondViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btnCreateAccPress(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension RegisterViewController : SelectCityDelegate{
    func selectedCity(cityName: String) {
        lblCity.text = cityName
    }
}
