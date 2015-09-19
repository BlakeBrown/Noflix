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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        let borderAlpha : CGFloat = 0.8
        let cornerRadius : CGFloat = UIScreen.mainScreen().bounds.height*0.25*0.5
        
        fivekm.backgroundColor = UIColor.clearColor()
        fivekm.layer.borderWidth = 8.0
        fivekm.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        fivekm.layer.cornerRadius = cornerRadius
        
        tenkm.backgroundColor = UIColor.clearColor()
        tenkm.layer.borderWidth = 8.0
        tenkm.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        tenkm.layer.cornerRadius = cornerRadius
        
        fifteenkm.backgroundColor = UIColor.clearColor()
        fifteenkm.layer.borderWidth = 8.0
        fifteenkm.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        fifteenkm.layer.cornerRadius = cornerRadius
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
