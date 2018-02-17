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
    
    var tempTermCon = 0
    var tempSelCity = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtMobNum.setLeftIcon("phonecall.png")
        ttMail.setLeftIcon("mail.png")
        txtName.setLeftIcon("user.png")
        
        btnCity.backgroundColor = .white
        btnCity.layer.cornerRadius = 5
        btnCity.layer.borderWidth = 1
        btnCity.layer.borderColor = UIColor.white.cgColor
        
        
        let imageData = try? Data(contentsOf: Bundle.main.url(forResource: "citygif", withExtension: "gif")!)
        let advTimeGif = UIImage.gifImageWithData(imageData!)
        imgGif.image = advTimeGif
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    // Mark: Custum Method
    
    func checkValidation(){
        
        var flgValidation = true
        
        if  !Validation1.checkNotNullString(checkStr: txtName.text!){
            self.view.makeToast(Messages.nameNotNull)
            flgValidation = false
        }
        else if  !Validation1.isOnlyAplphabets(str: txtName.text!){
            self.view.makeToast(Messages.nameWithCharcter)
            flgValidation = false
        }
        else if (txtName.text?.characters.count)! < Value.nameLength{
            self.view.makeToast(Messages.nameLength)
            flgValidation = false
        }else if  !Validation1.checkNotNullString(checkStr: txtMobNum.text!){
            self.view.makeToast(Messages.phoneNotNull)
            flgValidation = false
        }else if !Validation1.isValidatePhone(phoneNumber:txtMobNum.text!){
            self.view.makeToast(Messages.phoneMsg)
            flgValidation = false
        }else if (txtMobNum.text?.characters.count)! < Value.nameLength{
            self.view.makeToast(Messages.phoneLength)
            flgValidation = false
        }else if  lblCity.text! == "Click Here to select your city" || lblCity.text! == "" {
             self.view.makeToast(Messages.cityMsg)
             flgValidation = false
        }else if  tempTermCon == 0{
            self.view.makeToast(Messages.termConditionMsg)
            flgValidation = false
        }
        
        
        if ttMail.text! !=  ""{
            if !Validation1.isValidEmail(testEmail: ttMail.text!){
              self.view.makeToast(Messages.emailMsg)
                flgValidation = false
            }
        }
        
        if flgValidation{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // Mark: IBAction Method
    @IBAction func btnSelCityPress(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectCityViewController") as! SelectCityViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.delegate = self
       self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func btnTermsAndConditionPress(_ sender: Any) {
        imgCheckUncheck.image = UIImage(named:ImageName.termAndCondition)
        tempTermCon = 1
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TermCondViewController") as! TermCondViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btnCreateAccPress(_ sender: Any) {

        checkValidation()
    }
    
    
}

 // Mark: SelectCityDelegate Method
extension RegisterViewController : SelectCityDelegate{
    func selectedCity(cityName: String) {
        lblCity.text = cityName
    
    }
}

// Mark: SelectCityDelegate Method
extension RegisterViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtName{
            ttMail.becomeFirstResponder()
        }else if textField == ttMail{
            txtMobNum.becomeFirstResponder()
        }else if textField == txtMobNum{
            txtMobNum.resignFirstResponder()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtMobNum{
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= Value.mobNumberLength
        }
        
        return true
    }
}
