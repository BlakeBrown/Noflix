//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {

    @IBOutlet weak var maleBtn: UIButton!
    
    var businesses: [Business]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
//            self.businesses = businesses
//            
//            for business in businesses {
//                println(business.name!)
//                println(business.address!)
//            }
//        })
        
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["italian"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            if (businesses != nil){
                for business in businesses {
                    print(business.name!)
                    print(" | ")
                    print(business.address!)
                    print(" \n")
                }
            }
        }
        
        let borderAlpha : CGFloat = 0.8
        let cornerRadius : CGFloat = UIScreen.mainScreen().bounds.height*0.25*0.5
        
        maleBtn.backgroundColor = UIColor.clearColor()
        maleBtn.layer.borderWidth = 8.0
        maleBtn.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        maleBtn.layer.cornerRadius = cornerRadius
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
