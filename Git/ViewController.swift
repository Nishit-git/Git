//
//  ViewController.swift
//  Git
//
//  Created by Nishit on 2017-10-06.
//  Copyright © 2017 Nishit. All rights reserved.
//

import UIKit
import SpriteKit
class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var featureScrollView: UIScrollView!
    @IBOutlet weak var featurePageControl: UIPageControl!
    @IBOutlet weak var getStartedButton: UIButton!
    
    
    let feature1 = ["title": "Are you lost?", "price": "We got you!!", "image":"1.jpg"]
     let feature2 = ["title": "Feeling Confused?", "price": "Look no further!!", "image":"2.jpg"]
     let feature3 = ["title": "Sheridan Insider", "price": "Compatible with Apple Watch", "image":"5.jpg"]
    
    var featureArray = [Dictionary<String,String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        featureArray = [feature1, feature2, feature3]
        featureScrollView.isPagingEnabled = true
        featureScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(featureArray.count), height: 250)
        featureScrollView.showsHorizontalScrollIndicator = false
        
        featureScrollView.delegate = self
        getStartedButton.isEnabled = false
        getStartedButton.layer.cornerRadius = 15
        
        loadFeatures()
        
    }

    func loadFeatures()
    {
        for(index, feature) in featureArray.enumerated() {
            if let featureView = Bundle.main.loadNibNamed("Feature", owner: self, options:nil)?.first as?  FeatureView {
                featureView.featureImageView.image = UIImage(named: feature["image"]!)
                featureView.titleLabel.text = feature["title"]
                featureView.priceLabel.text = feature["price"]
                
                featureScrollView.addSubview(featureView)
                featureView.frame.size.width = self.view.bounds.size.width
                featureView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        
        featurePageControl.currentPage = Int(page)
        if(featurePageControl.currentPage == 2)
        {
            getStartedButton.isEnabled = true
        }
        else
        {
            getStartedButton.isEnabled = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

