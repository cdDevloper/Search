//
//  MapViewController.swift
//  PageBasedDemo
//
//  Created by Jayesh on 2/8/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {

    @IBOutlet  var mapView: MKMapView!
    @IBOutlet weak var topMapConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewNavigation: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var flgHideNavigation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if flgHideNavigation{
            viewNavigation.isHidden = true
            topMapConstraint.constant = 64.0
        }
    }
    
    
    @IBAction func btnBackPress(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
