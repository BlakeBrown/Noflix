//
//  PriceViewController.swift
//  Noflix
//
//  Created by Austin Du on 2015-09-19.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class PriceViewController: UIViewController {

    var locationRadius: Int!
    
    @IBOutlet weak var twentyDollars: UIButton!
    @IBOutlet weak var thirtyfiveDollars: UIButton!
    @IBOutlet weak var fiftyDollars: UIButton!
    @IBOutlet weak var seventyfiveDollars: UIButton!
    @IBOutlet weak var onehundredDollars: UIButton!
    @IBOutlet weak var onehundredfiftyDollars: UIButton!
    
    var lat: Double!
    var long: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let borderAlpha : CGFloat = 0.8
        //        let cornerRadius : CGFloat = UIScreen.mainScreen().bounds.width*0.25*0.5
        let cornerRadius : CGFloat = 65
        
        twentyDollars.backgroundColor = UIColor.clearColor()
        twentyDollars.layer.borderWidth = 5.0
        twentyDollars.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        twentyDollars.layer.cornerRadius = cornerRadius
        
        thirtyfiveDollars.backgroundColor = UIColor.clearColor()
        thirtyfiveDollars.layer.borderWidth = 5.0
        thirtyfiveDollars.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        thirtyfiveDollars.layer.cornerRadius = cornerRadius
        
        fiftyDollars.backgroundColor = UIColor.clearColor()
        fiftyDollars.layer.borderWidth = 8.0
        fiftyDollars.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        fiftyDollars.layer.cornerRadius = cornerRadius
        
        seventyfiveDollars.backgroundColor = UIColor.clearColor()
        seventyfiveDollars.layer.borderWidth = 8.0
        seventyfiveDollars.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        seventyfiveDollars.layer.cornerRadius = cornerRadius
        
        onehundredDollars.backgroundColor = UIColor.clearColor()
        onehundredDollars.layer.borderWidth = 11.0
        onehundredDollars.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        onehundredDollars.layer.cornerRadius = cornerRadius
        
        onehundredfiftyDollars.backgroundColor = UIColor.clearColor()
        onehundredfiftyDollars.layer.borderWidth = 11.0
        onehundredfiftyDollars.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        onehundredfiftyDollars.layer.cornerRadius = cornerRadius
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToVCPrice(segue: UIStoryboardSegue) {
        if(segue.sourceViewController .isKindOfClass(PriceViewController))
        {
            print("back to price");
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "20") {
            var venue : VenueViewController = segue.destinationViewController as! VenueViewController
            venue.price = 20
            venue.locationRadius = self.locationRadius
            venue.lat = lat;
            venue.long = long;
        }
        if (segue.identifier == "35") {
            var venue : VenueViewController = segue.destinationViewController as! VenueViewController
            venue.price = 35
            venue.locationRadius = self.locationRadius
            venue.lat = lat;
            venue.long = long;
        }
        if (segue.identifier == "50") {
            var venue : VenueViewController = segue.destinationViewController as! VenueViewController
            venue.price = 50
            venue.locationRadius = self.locationRadius
            venue.lat = lat;
            venue.long = long;
            
        }
        if (segue.identifier == "75") {
            var venue : VenueViewController = segue.destinationViewController as! VenueViewController
            venue.price = 75
            venue.locationRadius = self.locationRadius
            venue.lat = lat;
            venue.long = long;
        }
        if (segue.identifier == "100") {
            var venue : VenueViewController = segue.destinationViewController as! VenueViewController
            venue.price = 100
            venue.locationRadius = self.locationRadius
            venue.lat = lat;
            venue.long = long;
            
        }
        if (segue.identifier == "150") {
            var venue : VenueViewController = segue.destinationViewController as! VenueViewController
            venue.price = 150
            venue.locationRadius = self.locationRadius
            venue.lat = lat;
            venue.long = long;
        }
    }


}
