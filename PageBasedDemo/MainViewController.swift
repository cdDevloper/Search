//
//  ViewController.swift
//  imgSlideViewDemo
//
//  Created by Bhagwant-MacBook on 04/01/18.
//  Copyright © 2018 CDDevloper. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var currentPage:Int = 0
    
    var arrImg:[String] = ["mycity.png","specialoffers1.jpg","emergency.jpg","events.jpg","hospital.jpg","medical.jpg","mobile.jpg","computer.jpg","cloths.jpg","shoes.jpg","hotel.jpg","pizza.jpg","travels.jpg","giftcosmatics.jpg","minibazar.jpg","busines.png","buildersanddevelopers.jpg","constraction.jpg","advocate.jpg","financial.jpg","jewelry.png","designandprint.jpg","homeapplince.jpg","homeservices.jpg","educational.jpg","agents.jpg","sweetmart.jpg","colddrinks.jpg","hardwareciramic.jpg","furniture.jpg","marriage.jpg","transport.jpg","gymyoga.jpg","parlour.jpg","automobiles.jpg","industrial.jpg","opticals.jpg","bags.jpg","aggriculture.JPG","petanimals.jpg"]
    
    var arrCat:[String] = ["MyCity","Special Offers","Emergency","Movies & Events","Hospital","Medical","Mobile Shop","Computers","Cloth Shop","Shoes","Hotel","Pizza","Tours & Travels","Gift & Cosmetics","Bazaar & Grocery","Business & Jobs","B & D","Construction","Advocate","Financial","Jewellery Shop","Design & Print","Home Products","Home Service","Educational","All Agents","Sweet Mart","Coldrinks","Hardware & Ceramics", "Home Decor & Furniture","Marriage & Events","Transport & Courier","Gym & Yoga","Parlours","Automobiles","Industrial","Opticals","Bags","Agriculture","Pet Animals"]
    
    
     @IBOutlet weak var lblCity: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    //Mark: Custum Methods
    
    func didTap()
    {
       print(currentPage)
    }
    
    //MARK: IBAction Methods
    @IBAction func btnChangeCityPress(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangeCityViewController") as! ChangeCityViewController
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



// Mark: UICollectionView Delegat and Datasource Methods
extension MainViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCat.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (UIScreen.main.bounds.size.width/2)-15
        return CGSize(width: width, height:179)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainTypeCell", for: indexPath) as! MainTypeCollectionViewCell
         cell.cardView()
        cell.imgViewMainType.image = UIImage(named:arrImg[indexPath.row])
        cell.lblMainType.text      = arrCat[indexPath.row]
    
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
            switch kind {
                
            case UICollectionElementKindSectionHeader:
                
                let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: "imgSlideViewCell",
                                                                           for: indexPath) as! SlideViewCollectionReusableView
                
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
            default:
                
                assert(false, "Unexpected element kind")
            }
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row > 1{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SubCategoryViewController") as! SubCategoryViewController
            vc.strTitle = arrCat[indexPath.row]
            vc.flgViewController = ""
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SubCategoryViewController") as! SubCategoryViewController
            vc.strTitle = arrCat[indexPath.row]
            vc.flgViewController = "offer"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

//Mark: Custum Methods
extension MainViewController : ChangeCityDelegate{
    func changeCity(cityName: String) {
        lblCity.text = cityName
    }

}
