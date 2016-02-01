//
//  LoginViewController.swift
//  onthemap
//
//  Created by Sae on 1/28/16.
//  Copyright © 2016 Sae. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if (segue.identifier == "login"){
            let _:UITabBarController = segue.destinationViewController as! UITabBarController
        }else{  // http://www.ioscreator.com/tutorials/display-an-alert-view-in-ios8-with-swift
            let alertController = UIAlertController(title: "On the map", message: "Incorrect username or password", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func udacityLogin(sender: AnyObject) {
        requestSession()
        getPublicUserData()
        performSegueWithIdentifier("login", sender: self)
    }
}

