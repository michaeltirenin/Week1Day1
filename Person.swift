//
//  Person.swift
//  ClassRosterB19
//
//  Created by Michael Tirenin on 7/21/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

//import Foundation
import UIKit

class Person : NSObject {
    
    var firstName : String
    var lastName : String
    var imageName : String
    var twitterHandle : String
    var githubHandle : String

    var picture : UIImage
    
    init(firstName : String, lastName : String, imageName : String, twitterHandle : String, githubHandle : String) {
        self.firstName = firstName
        self.lastName = lastName
        self.imageName = imageName
        self.twitterHandle = twitterHandle
        self.githubHandle = githubHandle

        self.picture = UIImage(named: imageName)
    }
    
    // this isn't used, just an example
//    func fullName() -> String {
//        return self.firstName + self.lastName
//    }
    
    class func arrayOfPersonsFromPList() -> Array<Person> {
        var roster = Array<Person>()
        
        let classRosterFromPList = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("ClassRoster", ofType: "plist"))
        
        for object in classRosterFromPList {
            if let person = object as? Dictionary<String, String> {
                let firstName = person["firstName"] as String
                let lastName = person["lastName"] as String
                let imageName = person["imageName"] as String
                let twitterHandle = person["twitterHandle"] as String
                let githubHandle = person["githubHandle"] as String
                
                roster.append(Person(firstName: firstName, lastName: lastName, imageName: imageName, twitterHandle: twitterHandle, githubHandle: githubHandle))
            }
        }
        return roster
//        println(classRosterFromPList)
    }
}