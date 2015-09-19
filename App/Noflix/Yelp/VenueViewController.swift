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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
