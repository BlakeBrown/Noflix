//
//  LocationViewController.swift
//  Noflix
//
//  Created by Austin Du on 2015-09-19.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    @IBOutlet weak var fivekm: UIButton!
    @IBOutlet weak var tenkm: UIButton!
    @IBOutlet weak var fifteenkm: UIButton!
    @IBOutlet weak var twentyfivekm: UIButton!
    @IBOutlet weak var thirtyfivekm: UIButton!
    @IBOutlet weak var fiftykm: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let borderAlpha : CGFloat = 0.8
//        let cornerRadius : CGFloat = UIScreen.mainScreen().bounds.width*0.25*0.5
        let cornerRadius : CGFloat = 65
        
        fivekm.backgroundColor = UIColor.clearColor()
        fivekm.layer.borderWidth = 5.0
        fivekm.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        fivekm.layer.cornerRadius = cornerRadius
        
        tenkm.backgroundColor = UIColor.clearColor()
        tenkm.layer.borderWidth = 5.0
        tenkm.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        tenkm.layer.cornerRadius = cornerRadius
        
        fifteenkm.backgroundColor = UIColor.clearColor()
        fifteenkm.layer.borderWidth = 8.0
        fifteenkm.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        fifteenkm.layer.cornerRadius = cornerRadius
        
        twentyfivekm.backgroundColor = UIColor.clearColor()
        twentyfivekm.layer.borderWidth = 8.0
        twentyfivekm.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        twentyfivekm.layer.cornerRadius = cornerRadius
        
        thirtyfivekm.backgroundColor = UIColor.clearColor()
        thirtyfivekm.layer.borderWidth = 11.0
        thirtyfivekm.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        thirtyfivekm.layer.cornerRadius = cornerRadius
        
        fiftykm.backgroundColor = UIColor.clearColor()
        fiftykm.layer.borderWidth = 11.0
        fiftykm.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        fiftykm.layer.cornerRadius = cornerRadius
        
    }
    
    @IBAction func unwindToVCLocation(segue: UIStoryboardSegue) {
        if(segue.sourceViewController .isKindOfClass(LocationViewController))
        {
            print("back to location");
        }
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "5") {
            var price : PriceViewController = segue.destinationViewController as! PriceViewController
            price.locationRadius = 5
        }
        if (segue.identifier == "10") {
            var price : PriceViewController = segue.destinationViewController as! PriceViewController
            price.locationRadius = 10
        }
        if (segue.identifier == "15") {
            var price : PriceViewController = segue.destinationViewController as! PriceViewController
            price.locationRadius = 15
            
        }
        if (segue.identifier == "25") {
            var price : PriceViewController = segue.destinationViewController as! PriceViewController
            price.locationRadius = 25
        }
        if (segue.identifier == "35") {
            var price : PriceViewController = segue.destinationViewController as! PriceViewController
            price.locationRadius = 35
            
        }
        if (segue.identifier == "50") {
            var price : PriceViewController = segue.destinationViewController as! PriceViewController
            price.locationRadius = 50
        }
    }
    

}
