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
    
     //var arrMenuImg:[String] = ["mycity.png","mycity.png","mycity.png","mycity.png","mycity.png"]
     var arrMenuStr:[String] = ["Share","Employee Login","About Us!","For User Info.","App Guide Video"]
    
    
    var arrImg:[String] = ["mycity.png","specialoffers.jpg","emergency.jpg","events.jpg","hospital.jpg","medical.jpg","mobile.jpg","computer.jpg","cloths.jpg","shoes.jpg","hotel.jpg","pizza.jpg","travels.jpg","giftcosmatics.jpg","minibazar.jpg","jobs.jpg","buildersanddevelopers.jpg","constraction.jpg","advocate.jpg","financial.jpg","jewelry.png","designandprint.jpg","homeapplince.jpg","homeservices.jpg","educational.jpg","agents.jpg","sweetmart.jpg","colddrinks.jpg","hardwareciramic.jpg","furniture.jpg","marriage.jpg","transport.jpg","gymyoga.jpg","parlour.jpg","automobiles.jpg","industrial.jpg","opticals.jpg","bags.jpg","aggriculture.JPG","petanimals.jpg"]
    
    var arrCat:[String] = ["MyCity","Special Offers","Emergency","Movies & Events","Hospital","Medical","Mobile Shop","Computers","Cloth Shop","Shoes","Hotel","Pizza","Tours & Travels","Gift & Cosmetics","Bazaar & Grocery","Business & Jobs","B & D","Construction","Advocate","Financial","Jewellery Shop","Design & Print","Home Products","Home Service","Educational","All Agents","Sweet Mart","Coldrinks","Hardware & Ceramics", "Home Decor & Furniture","Marriage & Events","Transport & Courier","Gym & Yoga","Parlours","Automobiles","Industrial","Opticals","Bags","Agriculture","Pet Animals"]
    
    
     @IBOutlet weak var lblCity: UILabel!
    
    //SlideView
    @IBOutlet var tblView: UITableView!
    @IBOutlet var slideView: UIView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblMenuCity: UILabel!
    @IBOutlet var lblOfflineService: UILabel!
    @IBOutlet var lblProfile: UILabel!
    @IBOutlet var imgOfflineSer: UIImageView!
    @IBOutlet var imgProfile: UIImageView!

     @IBOutlet var collView: UICollectionView!
    var flgAnimatedLbl = true


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide SlideMenu
         menuHide()
        
        //Table View Setting
        tblView.estimatedRowHeight = 45.0
        tblView.separatorStyle = .none
        
        let nibName = UINib(nibName: "AnimatedLabelCollectionReusableView", bundle:nil)
        collView.register(nibName, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "animatedLabel")
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    //Mark: Custum Methods
    
    // function which is triggered when handleTap is called
    func handleTap(_ sender: UITapGestureRecognizer) {
        print("Hello World")
    }
    
    func didTap()
    {
       print(currentPage)
    }
    
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

    func rgisterButton(_ sender: UIButton) {
       print("Press")
    }
    
    //MARK: IBAction Methods
    @IBAction func btnChangeCityPress(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangeCityViewController") as! ChangeCityViewController
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnSearchPress(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    @IBAction func btnMenuPress(_ sender: Any) {
        self.menuOpen()
    }
    
    @IBAction func btnbHideMenu(_ sender: Any){
        self.menuHide()
        
    }
    
}



// Mark: UICollectionView Delegat and Datasource Methods
extension MainViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       if section == 0{
            return 0
        }else{
            return arrCat.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width = (UIScreen.main.bounds.size.width/2)-15
        return CGSize(width: width, height:179)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainTypeCell", for: indexPath) as! MainTypeCollectionViewCell
        // cell.cardView()
        cell.imgViewMainType.image = UIImage(named:arrImg[indexPath.row])
        cell.lblMainType.text      = arrCat[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
            switch kind {
                
            case UICollectionElementKindSectionHeader:
                
                if indexPath.section == 0{
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
                }else{
                    
                    let animatedView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "animatedLabel", for: indexPath) as! AnimatedLabelCollectionReusableView
                    
                    if flgAnimatedLbl{
                        flgAnimatedLbl = false
                        let lblAnimated = LoopLabelView(frame: CGRect(x: 0, y: 0, width: self.collView.frame.size.width, height: 20))
                        lblAnimated.text = "Click here for your Advertise Now...! For More Info - 933 933 4444        "
                        animatedView.addSubview(lblAnimated)
                    }
                    
                    let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
                    tap.numberOfTapsRequired = 1
                    animatedView.isUserInteractionEnabled = true
                    animatedView.addGestureRecognizer(tap)
                    return animatedView
                }
                
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
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyCityDetailViewController") as! MyCityDetailViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        if section == 0{
            return CGSize(width: self.collView.bounds.width, height:174.0)
        }else{
            return CGSize(width: self.collView.bounds.width, height:30.0)
        }
    }
    
    
}


// MARK: - TableView Delegate and DataSource
extension MainViewController : UITableViewDelegate,UITableViewDataSource
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
        cell.imgMenuCell.image = UIImage(named:"dot.png")// arrMenuImg[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        menuHide()
    }

}

//Mark: Custum Methods
extension MainViewController : ChangeCityDelegate{
    func changeCity(cityName: String) {
        lblCity.text = cityName
    }

}


class LoopLabelView: UIView {
    
    private var labelText : String?
    private var rect0: CGRect!
    private var rect1: CGRect!
    private var labelArray = [UILabel]()
    private var isStop = false
    private var timeInterval: TimeInterval!
    private let leadingBuffer = CGFloat(25.0)
    private let loopStartDelay = 2.0
    
//    required public init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    var text: String? {
        didSet {
            labelText = text
            setup()
        }
    }
    
    func setup() {
        self.backgroundColor = UIColor.clear
        let label = UILabel()
        label.text = labelText
        label.frame = CGRect.zero
        label.textColor = Color.bussBgColor
        
        timeInterval = TimeInterval((labelText?.characters.count)! / 5)
        let sizeOfText = label.sizeThatFits(CGSize.zero)
        let textIsTooLong = true//sizeOfText.width > frame.size.width ? true : false
        
        rect0 = CGRect(x: leadingBuffer, y: 0, width: sizeOfText.width, height: self.bounds.size.height)
        rect1 = CGRect(x: rect0.origin.x + rect0.size.width, y: 0, width: sizeOfText.width, height: self.bounds.size.height)
        label.frame = rect0
        
        super.clipsToBounds = true
        labelArray.append(label)
        self.addSubview(label)
        
        //self.frame = CGRect(origin: self.frame.origin, size: CGSize(width: 0, height: 0))
        
        if textIsTooLong {
            let additionalLabel = UILabel(frame: rect1)
            additionalLabel.text = labelText
            additionalLabel.textColor = Color.bussBgColor
            self.addSubview(additionalLabel)
            
            labelArray.append(additionalLabel)
            
            animateLabelText()
        }
    }
    
    func animateLabelText() {
        if(!isStop) {
            let labelAtIndex0 = labelArray[0]
            let labelAtIndex1 = labelArray[1]
            
            UIView.animate(withDuration: timeInterval, delay: loopStartDelay, options: [.curveLinear], animations: {
                labelAtIndex0.frame = CGRect(x: -self.rect0.size.width,y: 0,width: self.rect0.size.width,height: self.rect0.size.height)
                labelAtIndex1.frame = CGRect(x: labelAtIndex0.frame.origin.x + labelAtIndex0.frame.size.width,y: 0,width: labelAtIndex1.frame.size.width,height: labelAtIndex1.frame.size.height)
            }, completion: { finishied in
                labelAtIndex0.frame = self.rect1
                labelAtIndex1.frame = self.rect0
                
                self.labelArray[0] = labelAtIndex1
                self.labelArray[1] = labelAtIndex0
                self.animateLabelText()
            })
        } else {
            self.layer.removeAllAnimations()
        }
    }
}
