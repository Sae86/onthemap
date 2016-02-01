//
//  StudentInformation.swift
//  onthemap
//
//  Created by Sae on 1/31/16.
//  Copyright © 2016 Sae. All rights reserved.
//

import Foundation
import UIKit
import MapKit

struct StudentInformation {
    var first: String
    var last: String
    var mediaURL: String
    var coordinates = CLLocationCoordinate2D()
    
    init( dictionary:Dictionary<String, AnyObject> ){
        let lat = CLLocationDegrees(dictionary["latitude"] as! Double)
        let long = CLLocationDegrees(dictionary["longitude"] as! Double)
        
        self.first = dictionary["firstName"] as! String
        self.last = dictionary["lastName"] as! String
        self.mediaURL = dictionary["mediaURL"] as! String
        self.coordinates = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
    }

}