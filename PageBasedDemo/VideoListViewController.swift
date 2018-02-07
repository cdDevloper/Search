//
//  VideoListViewController.swift
//  PageBasedDemo
//
//  Created by Bhagwant-MacBook on 11/01/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

class VideoListViewController: UIViewController {

    @IBOutlet weak var collView: UICollectionView!
    var arrImg:[String] = ["mycity.png","specialoffers1.jpg","emergency.jpg","events.jpg","hospital.jpg","medical.jpg","mobile.jpg","computer.jpg","cloths.jpg","shoes.jpg","hotel.jpg","pizza.jpg","travels.jpg","giftcosmatics.jpg","minibazar.jpg","busines.png","buildersanddevelopers.jpg","constraction.jpg","advocate.jpg","financial.jpg","jewelry.png","designandprint.jpg","homeapplince.jpg","homeservices.jpg","educational.jpg","agents.jpg","sweetmart.jpg","colddrinks.jpg","hardwareciramic.jpg","furniture.jpg","marriage.jpg","transport.jpg","gymyoga.jpg","parlour.jpg","automobiles.jpg","industrial.jpg","opticals.jpg","bags.jpg","aggriculture.JPG","petanimals.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

// Mark: UICollectionView Delegat and Datasource Methods
extension VideoListViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (UIScreen.main.bounds.size.width/2)-15
        return CGSize(width: width, height:179)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath) as! MainTypeCollectionViewCell
        cell.imgViewMainType.image = UIImage(named:arrImg[indexPath.row])
        
        return cell
        
    }
    
    
}
