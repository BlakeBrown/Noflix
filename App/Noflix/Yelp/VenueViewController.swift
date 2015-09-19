//
//  VenueViewController.swift
//  Noflix
//
//  Created by Austin Du on 2015-09-19.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class VenueViewController: UIViewController {

    @IBOutlet weak var restaurants: UIButton!
    @IBOutlet weak var movies: UIButton!
    @IBOutlet weak var exhibits: UIButton!
    @IBOutlet weak var active: UIButton!
    @IBOutlet weak var shows: UIButton!
    
    var price: Int!
    var locationRadius: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let borderAlpha : CGFloat = 0.8
        //        let cornerRadius : CGFloat = UIScreen.mainScreen().bounds.width*0.25*0.5
        let cornerRadius : CGFloat = 65
        
        restaurants.backgroundColor = UIColor.clearColor()
        restaurants.layer.borderWidth = 5.0
        restaurants.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        restaurants.layer.cornerRadius = cornerRadius
        
        movies.backgroundColor = UIColor.clearColor()
        movies.layer.borderWidth = 5.0
        movies.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        movies.layer.cornerRadius = cornerRadius
        
        exhibits.backgroundColor = UIColor.clearColor()
        exhibits.layer.borderWidth = 8.0
        exhibits.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        exhibits.layer.cornerRadius = cornerRadius
        
        active.backgroundColor = UIColor.clearColor()
        active.layer.borderWidth = 8.0
        active.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        active.layer.cornerRadius = cornerRadius
        
        shows.backgroundColor = UIColor.clearColor()
        shows.layer.borderWidth = 11.0
        shows.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        shows.layer.cornerRadius = cornerRadius
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "restaurants") {
            var final : FinalViewController = segue.destinationViewController as! FinalViewController
            final.price = self.price
            final.locationRadius = self.locationRadius
            final.venue = "restaurant"
        }
        if (segue.identifier == "movies") {
            var final : FinalViewController = segue.destinationViewController as! FinalViewController
            final.price = self.price
            final.locationRadius = self.locationRadius
            final.venue = "movie"
        }
        if (segue.identifier == "active") {
            var final : FinalViewController = segue.destinationViewController as! FinalViewController
            final.price = self.price
            final.locationRadius = self.locationRadius
            final.venue = "active"
            
        }
        if (segue.identifier == "exhibits") {
            var final : FinalViewController = segue.destinationViewController as! FinalViewController
            final.price = self.price
            final.locationRadius = self.locationRadius
            final.venue = "exhibit"
        }
        if (segue.identifier == "shows") {
            var final : FinalViewController = segue.destinationViewController as! FinalViewController
            final.price = self.price
            final.locationRadius = self.locationRadius
            final.venue = "show"
            
        }
    }


}
