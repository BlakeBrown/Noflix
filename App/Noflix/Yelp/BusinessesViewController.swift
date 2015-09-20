//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
import CoreLocation

class BusinessesViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var locationManager = CLLocationManager()
    var lat: Double!
    var long: Double!
    var curLocation: CLLocation!
    
    var colourIndex = -1;
    var colourArray: [UIColor!] = [UIColor(red: 234.0/255, green: 253.0/255, blue: 230.0/255, alpha: 1.0),
        UIColor(red: 190.0/255, green: 242.0/255, blue: 2.0/255, alpha: 1.0),
        UIColor(red: 234.0/255, green: 255.0/255, blue: 135.0/255, alpha: 1.0),
        UIColor(red: 172.0/255, green: 255.0/255, blue: 233.0/255, alpha: 1.0),
        UIColor(red: 232.0/255, green: 70.0/255, blue: 36.0/255, alpha: 1.0),
        UIColor(red: 232.0/255, green: 167.0/255, blue: 38.0/255, alpha: 1.0),
        UIColor(red: 255.0/255, green: 144.0/255, blue: 171.0/255, alpha: 1.0),
        UIColor(red: 225.0/255, green: 245.0/255, blue: 196.0/255, alpha: 1.0),
        UIColor(red: 240.0/255, green: 57.0/255, blue: 43.0/255, alpha: 1.0),
        UIColor(red: 235.0/255, green: 235.0/255, blue: 207.0/255, alpha: 1.0)]
    
    var businesses: [Business]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization();
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            
        }
        else{
            print("Location service disabled");
        }
        
        let borderAlpha : CGFloat = 0.8
        let cornerRadius : CGFloat = UIScreen.mainScreen().bounds.height*0.25*0.5
        
        maleBtn.backgroundColor = UIColor.clearColor()
        maleBtn.layer.borderWidth = 8.0
        maleBtn.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        maleBtn.layer.cornerRadius = cornerRadius
        
    }
    
    override func viewDidAppear(animated: Bool) {
        changeColour()
    }
    
    func changeColour(){
        self.colourIndex++;
        if (self.colourIndex == colourArray.count){
            self.colourIndex = 0;
        }
        UIView.transitionWithView(titleLabel, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.titleLabel.textColor = self.colourArray[self.colourIndex]
            }, completion: { finished in
                self.changeColour()
        })
    }
    
    @IBAction func unwindToVCMain(segue: UIStoryboardSegue) {
        if(segue.sourceViewController .isKindOfClass(LocationViewController))
        {
            print("back to main");
        }
    }

    @IBAction func beginBtn(sender: UIButton) {

        
    }
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        let locValue : CLLocationCoordinate2D = locationManager.location!.coordinate;
        long = locValue.longitude;
        lat = locValue.latitude;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var nextVC : LocationViewController = segue.destinationViewController as! LocationViewController
        nextVC.lat = self.lat
        nextVC.long = self.long
        
    }


}
