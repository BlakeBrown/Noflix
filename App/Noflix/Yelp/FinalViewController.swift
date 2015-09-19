//
//  FinalViewController.swift
//  Noflix
//
//  Created by Blake Brown on 2015-09-19.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    var price: Int!
    var locationRadius: Int!
    var venue: String!
    
    var businesses: [Business]!
    var sortedBusinesses: [Business]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(price)
        println(locationRadius)
        println(venue)
        
        Business.searchWithTerm(venue, sort: .Distance, categories: [], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            
            if (businesses != nil) {
                
                self.sortedBusinesses = businesses.sorted({ (a:Business, b:Business) -> Bool in
                    if(a.rating!.doubleValue > b.rating!.doubleValue) {
                        return true;
                    } else {
                        return false;
                    }
                })
                
                var topResult: Business!
                topResult = self.sortedBusinesses[0]
                print(topResult.address!)
                //self.performSegueWithIdentifier("transfer", sender: nil)
            }
        }
        
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
