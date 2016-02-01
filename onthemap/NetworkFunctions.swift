//
//  NetworkFunctions.swift
//  onthemap
//
//  Created by Sae on 1/31/16.
//  Copyright © 2016 Sae. All rights reserved.
//

import Foundation

func requestSession() {
    let request = NSMutableURLRequest(URL: NSURL(string: "https://www.udacity.com/api/session")!)
    request.HTTPMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.HTTPBody = "{\"udacity\": {\"username\": \"mrs.lovett.666@gmail.com\", \"password\": \"Gameslave86\"}}".dataUsingEncoding(NSUTF8StringEncoding)
    let session = NSURLSession.sharedSession()
    let task = session.dataTaskWithRequest(request) { data, response, error in
        if error != nil { // Handle error…
            return
        }
        let newData = data!.subdataWithRange(NSMakeRange(5, data!.length - 5)) /* subset response data! */
        print(NSString(data: newData, encoding: NSUTF8StringEncoding))
    }
    task.resume()
}

func deleteSession(){
    let request = NSMutableURLRequest(URL: NSURL(string: "https://www.udacity.com/api/session")!)
    request.HTTPMethod = "DELETE"
    var xsrfCookie: NSHTTPCookie? = nil
    let sharedCookieStorage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
    for cookie in sharedCookieStorage.cookies! {
        if cookie.name == "XSRF-TOKEN" { xsrfCookie = cookie }
    }
    if let xsrfCookie = xsrfCookie {
        request.setValue(xsrfCookie.value, forHTTPHeaderField: "X-XSRF-TOKEN")
    }
    let session = NSURLSession.sharedSession()
    let task = session.dataTaskWithRequest(request) { data, response, error in
        if error != nil { // Handle error…
            return
        }
        let newData = data!.subdataWithRange(NSMakeRange(5, data!.length - 5)) /* subset response data! */
        print(NSString(data: newData, encoding: NSUTF8StringEncoding))
    }
    task.resume()
}

func getPublicUserData(){
    let request = NSMutableURLRequest(URL: NSURL(string: "https://www.udacity.com/api/users/3903878747")!)
    let session = NSURLSession.sharedSession()
    let task = session.dataTaskWithRequest(request) { data, response, error in
        if error != nil { // Handle error...
            return
        }
        let newData = data!.subdataWithRange(NSMakeRange(5, data!.length - 5)) /* subset response data! */
        print(NSString(data: newData, encoding: NSUTF8StringEncoding))
    }
    task.resume()
}

func getStudentLocation(){
    let request = NSMutableURLRequest(URL: NSURL(string: "https://api.parse.com/1/classes/StudentLocation")!)
    request.addValue("QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr", forHTTPHeaderField: "X-Parse-Application-Id")
    request.addValue("QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY", forHTTPHeaderField: "X-Parse-REST-API-Key")
    let session = NSURLSession.sharedSession()
    let task = session.dataTaskWithRequest(request) { data, response, error in
        if error != nil { // Handle error...
            return
        }
        print(NSString(data: data!, encoding: NSUTF8StringEncoding))
    }
    task.resume()
}

func postStudentLocation(){
    let request = NSMutableURLRequest(URL: NSURL(string: "https://api.parse.com/1/classes/StudentLocation")!)
    request.HTTPMethod = "POST"
    request.addValue("QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr", forHTTPHeaderField: "X-Parse-Application-Id")
    request.addValue("QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY", forHTTPHeaderField: "X-Parse-REST-API-Key")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.HTTPBody = "{\"uniqueKey\": \"1234\", \"firstName\": \"John\", \"lastName\": \"Doe\",\"mapString\": \"Mountain View, CA\", \"mediaURL\": \"https://udacity.com\",\"latitude\": 37.386052, \"longitude\": -122.083851}".dataUsingEncoding(NSUTF8StringEncoding)
    let session = NSURLSession.sharedSession()
    let task = session.dataTaskWithRequest(request) { data, response, error in
        if error != nil { // Handle error…
            return
        }
        print(NSString(data: data!, encoding: NSUTF8StringEncoding))
    }
    task.resume()
}