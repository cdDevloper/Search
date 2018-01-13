//
//  ModelController.swift
//  PageBasedDemo
//
//  Created by Bhagwant-MacBook on 01/01/01.
//  Copyright © 2001 CDDevloper. All rights reserved.
//

import UIKit

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

protocol ModelViewControllerDelegate{
    func  moveToNextViewController(index:Int)
}
class ModelController: NSObject, UIPageViewControllerDataSource {

    var mainTitleData: [String] = []
    var subTitleData:  [String] = []
    var imgNameData:   [String] = []
    var btnTitleData:  [String] = []
    var indexData:Int = 0
    
    var delegate:ModelViewControllerDelegate?
    
    override init() {
        super.init()
        mainTitleData = ["Business","Special Offers!"]
        subTitleData  = ["The Easiest Way To Made Your Business!","The Easiest Way To Find Special Offers!"]
        imgNameData   = ["busines.png","speoffer.png"]
        btnTitleData   = ["NEXT","PROCEED"]
        indexData         = 0
    }

    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> DataViewController? {
        // Return the data view controller for the given index.
        if (self.mainTitleData.count == 0) || (index >= self.mainTitleData.count) {
            return nil
        }

        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        dataViewController.mainTitleData = self.mainTitleData[index]
        dataViewController.subTitleData = self.subTitleData[index]
        dataViewController.imgName = self.imgNameData[index]
        dataViewController.btnTitle = self.btnTitleData[index]
        dataViewController.index = index
        dataViewController.delegate = self
        return dataViewController
    }

    func indexOfViewController(_ viewController: DataViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return mainTitleData.index(of: viewController.mainTitleData) ?? NSNotFound
    }

    // MARK: - Page View Controller Data Source

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.mainTitleData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

}

//MARK: DataModelViewControllerDelegate

extension ModelController:DataViewControllerDelegate{
    func moveToNextViewController(index:Int){
        
        self.delegate?.moveToNextViewController(index:index)
    }
}

