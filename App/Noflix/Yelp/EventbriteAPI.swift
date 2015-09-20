//
//  ViewController.swift
//  Noflix
//
//  Created by Rosie Zou on 2015-09-19.
//  Copyright © 2015 Rosie Zou. All rights reserved.
//

import UIKit



class EventbriteAPI: UIViewController {
    
    var shouldReturn = false;
    var finalEbEventArray : [ebEvent] = [];
    
    struct ebEvent{
        var eventName: String
        var eventId: String
        var eventStart: String
        var eventLat:Double
        var eventLong:Double
    
    }
    
    let serverToken = "SnH3D6QyHROSvkeontJX6D8WWHXmexwC3AZwzOCB"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var ebEvents = finalEbEventArray
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func eventbriteLocation(locationRadius: String, userLongitude: String, userLatitude: String, userPrice:Int, withCompletion completion: [Double]->Void) -> Void {
        var eventArray = [ebEvent]()
        var coordinate = [Double](count: 2,repeatedValue: 0.0)
        let url: String = "https://www.eventbriteapi.com/v3/events/search/?expand=venue&location.within=\(locationRadius)&location.latitude=\(userLatitude)&location.longitude=\(userLongitude)&start_date.keyword=next_week&token=SMCIOG5QJ5ZIMC7XQDD6"
        
        getData(url, success: {(eventInfo) -> Void in
            let json = JSON(data: eventInfo)
            print(json)
            
            for (parameter, value) in json["events"]{
                let eventStarted = value["status"].stringValue
                let onlineEvent = value["online_event"].boolValue
                
                if eventStarted == "live" && onlineEvent == false {
                    let eventName = value["name"]["text"].stringValue
                    let eventId = value["id"].stringValue
                    let eventStart = value["start"]["local"].stringValue
                    let eventLat = value["venue"]["latitude"].numberValue
                    let eventLong = value["venue"]["longitude"].numberValue
                    let Event = ebEvent(eventName:eventName, eventId:eventId, eventStart:eventStart, eventLat: (eventLat as Double), eventLong:(eventLong as Double))
                    
                    eventArray.append(Event)
                }
                    
                }
            var finalArray = [ebEvent]()
            //sort by price
            for event in eventArray {
                self.eventbritePrice(userPrice, andEvent: event) { price in
                    finalArray.append(price)
                    
                    //grab longitude and latitude of final venue
                    coordinate[0] = (price.eventLat) as Double
                    coordinate[1] = (price.eventLong) as Double
                    
                    completion(coordinate)
                }
            }
            
            
        })
    }


    func eventbritePrice(userPrice: Int, andEvent event: ebEvent, withCompletion completion: ebEvent -> Void) -> Void {
        let tempEventId = event.eventId
        
        let url: String = "https://www.eventbriteapi.com/v3/events/\(tempEventId)/ticket_classes/?pos=at_the_door&token=\(serverToken)"
        
        getData(url, success: {(eventInfo) -> Void in
            let json = JSON(data: eventInfo)
            
            let cost = json["ticket_classes"]["cost"]["value"].numberValue
            let fee = json["ticket_classes"]["fee"]["value"].numberValue
            let tax = json["ticket_classes"]["tax"]["value"].numberValue
            print(cost)
            let totalCost: Int = ((cost as Int) + (fee as Int) + (tax as Int))/100
            
            if totalCost < userPrice {
                completion(event)
            }
        })
    }
    
    func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var session = NSURLSession.sharedSession()
        
        // Use NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"https://www.eventbriteapi.com", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        
        loadDataTask.resume()
    }
    
    func getData(url: String, success: ((eventInfo: NSData!) -> Void)){
        loadDataFromURL(NSURL(string: url)!, completion:{(data, error) -> Void in
            if let urlData = data {
                success(eventInfo: urlData)
            }
        })
    }
    
}