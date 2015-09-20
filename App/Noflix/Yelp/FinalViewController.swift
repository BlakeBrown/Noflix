//
//  FinalViewController.swift
//  Noflix
//
//  Created by Blake Brown on 2015-09-19.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
import Foundation
import Darwin
import SwiftyJSON

class FinalViewController: UIViewController {
    
    var price: Int!
    var locationRadius: Int!
    var venue: String!
    
    var businesses: [Business]!
    var sortedBusinesses: [Business]!
    
    var lat: Double!
    var long: Double!
    
    var topResult: Business!
    var geocoder = CLGeocoder()
    var dest_lat: Double!
    var dest_long: Double!
    var counter = 0;
    
    var beginLoc : CLLocation!
    var endLoc : CLLocation!
    
    @IBOutlet weak var spendPrice: UILabel!
    @IBOutlet weak var travelDistance: UILabel!
    @IBOutlet weak var StartAdventureBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let borderAlpha : CGFloat = 0.8
        let cornerRadius : CGFloat = 87.5
        StartAdventureBtn.setTitle("Start Your Adventure!", forState: .Normal)
        self.StartAdventureBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        StartAdventureBtn.backgroundColor = UIColor.clearColor()
        StartAdventureBtn.layer.borderWidth = 8.0
        StartAdventureBtn.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        StartAdventureBtn.layer.cornerRadius = cornerRadius
        
        Business.searchWithTerm(venue, sort: .Distance, categories: [], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            
            if (businesses != nil) {
                print("2")
                self.sortedBusinesses = businesses.sort({ (a:Business, b:Business) -> Bool in
                    if(a.rating!.doubleValue > b.rating!.doubleValue) {
                        return true;
                    } else {
                        return false;
                    }
                })
                
                
                self.topResult = self.sortedBusinesses[0]
                print(self.topResult.address!)
                print(self.topResult.distance!)
                
                //PRICE OF UBER FARE ///
                self.geocoder.geocodeAddressString("\(self.topResult.address!), ON, CA", completionHandler: {(placemarks, error) -> Void in
                    if((error) != nil) {
                        print("app is failing :(")
                        print("Error", error)
                        print(placemarks)
                    }
                    if let placemark = placemarks?.first {
                        print("3")
                        let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                        self.dest_lat = coordinates.latitude
                        self.dest_long = coordinates.longitude
                        print(self.lat)
                        print(self.long)
                        print(self.dest_lat)
                        print(self.dest_long)
                        let serverToken = "SnH3D6QyHROSvkeontJX6D8WWHXmexwC3AZwzOCB"
                        Alamofire.request(.GET, "https://api.uber.com/v1/estimates/price", parameters: ["server_token": serverToken, "start_latitude": self.lat, "start_longitude": self.long, "end_latitude": self.dest_lat, "end_longitude": self.dest_long])
                            .response {request, response, data, error in
                                
                                let json = JSON(data: data!)
                                
                                //let json = JSONValue(data: data!)
                                //var json = JSON(data: data!) as NSDictionary
        
                                
                                  let actualPrice = json["prices"][0]["low_estimate"]
                    
                                    
                                    print(actualPrice)
                                
            
                                
                                //PRICE//////////////////
                                
//                                self.spendPrice.text = self.topResult.distance
 
                                self.spendPrice.text = "$\(Int(String(actualPrice))!/4)"
                        }
                        
                    }
                    })
                    
         
                
                /////////////////////////
                
                //DISTANCE//////////////
                
                self.travelDistance.text = self.topResult.distance
                
                
                
                
                
                
//                self.geocoder.geocodeAddressString("\(self.topResult.address!), ON, Canada", completionHandler: {(placemarks, error) -> Void in
//                    if((error) != nil){
//                        print("Error", error)
//                        print(placemarks)
//                    }
//                    if let placemark = placemarks?.first {
//                        print("3")
//                        let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
//                        self.dest_lat = coordinates.latitude
//                        self.dest_long = coordinates.longitude
//                        print(self.dest_lat)
//                        print(self.dest_long)
//                        
//                        self.beginLoc = CLLocation(latitude: self.lat , longitude: self.long)
//                        self.endLoc = CLLocation(latitude: self.dest_lat , longitude: self.dest_long)
////                        print("distance: \(self.getDistance(self.beginLoc, destination: self.endLoc))")
//                        print("distance: \(self.calculateDistance(self.lat, long:self.long, dest_lat: self.dest_lat, dest_long: self.dest_long))")
//
//                        while (self.calculateDistance(self.lat, long:self.long, dest_lat: self.dest_lat, dest_long: self.dest_long) > 100){
////                        while (self.getDistance(self.beginLoc, destination: self.endLoc)/1609.34 > 100){
////                            print("distance: \(self.getDistance(self.beginLoc, destination: self.endLoc))")
//                            self.topResult = self.sortedBusinesses[self.counter+1]
//                            self.counter++;
//                        }
//                        
//                        let serverToken = "SnH3D6QyHROSvkeontJX6D8WWHXmexwC3AZwzOCB"
//                        
//                        Alamofire.request(.GET, "https://api.uber.com/v1/estimates/price", parameters: ["server_token": serverToken, "start_latitude": self.lat, "start_longitude": self.long, "end_latitude": self.dest_lat, "end_longitude": self.dest_long])
//                            .response {request, response, data, error in
//                                let json = JSON(data: data!);
//                                print (json);
//                        }
//                        
//                    }
//                })

            }
        }
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateDistance( lat:Double, long:Double, dest_lat:Double, dest_long:Double) -> Double{
        let diffx:Double = dest_lat - lat
        let diffy:Double = dest_long - long
        
        var answer = (sqrt(pow(diffx,2) + pow(diffy,2)))*0.7
        return answer
    }
        
    func getDistance(source:CLLocation,destination:CLLocation) -> Double{
        
        var distanceMeters = source.distanceFromLocation(destination)
        var distanceKM = distanceMeters / 1000
        let roundedTwoDigit = distanceKM.roundedTwoDigit
        return roundedTwoDigit
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

extension Double{
    
    var roundedTwoDigit:Double{
        
        return Double(round(100*self)/100)
        
    }
}
