//
//  Person.swift
//  ClassRosterB19
//
//  Created by Michael Tirenin on 7/21/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import Foundation

class Person {
    
    var firstName : String
    var lastName : String
    
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String {
        return self.firstName + self.lastName
    }
}

/*
John Clem
Brad Johnson
Victor Adu
Kirby Shabaga
Collin Atherton
Jeff Gayle
Dan Hoang
Mike Tirenin
Alex Rice
Leonardo Lee
*/
