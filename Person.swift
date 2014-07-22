//
//  Person.swift
//  ClassRosterB19
//
//  Created by Michael Tirenin on 7/21/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import Foundation
import UIKit

class Person : NSObject {
    
    var firstName : String
    var lastName : String
    
//    var picture : UIImage?
    
    var imageName : String
    
    init(firstName : String, lastName : String, imageName : String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.imageName = imageName
        
        // this isn't necessary (to init) since it either takes a value or is nil
        // self.picture = picture
    }
    
    func fullName() -> String {
        
        return self.firstName + self.lastName
    }
    
    class func arrayOfPersonsFromPList() -> Array<Person> {
        
        var roster = Array<Person>()
        
        let classRosterFromPList = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("ClassRoster", ofType: "plist"))
        
        for object in classRosterFromPList {
            if let person = object as? Dictionary<String, String> {
                let firstName = person["firstName"] as String
                let lastName = person["lastName"] as String
                let imageName = person["imageName"] as String
                // let image = UIImage(contentsOfPath:)
                roster.append(Person(firstName: firstName, lastName: lastName, imageName: imageName))
            }
        }
        return roster
        //        println(classRosterFromPList)
        //        println(classRosterFromPList.count)
    }

}