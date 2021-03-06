//
//  PersonTests.swift
//  ClassRosterB19
//
//  Created by Michael Tirenin on 7/21/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import XCTest
import UIKit
//import ClassRosterB19

class PersonTests: XCTestCase {
    
    var person = Person(firstName: "Russell", lastName: "Wilson", imageName: "blankface", twitterHandle: "@ruswil", githubHandle: "ruwilson")
    
//    var person = Person(firstName: "Russell", lastName: "Wilson")

    var classRoster = ["Person1", "Person2", "Person3"]
    
    var classRosterFromPList = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("ClassRoster", ofType: "plist"))

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPersonCreation() {
        XCTAssertNotNil(person, "person cannot be created")
    }
    
    func testFirstName() {
        XCTAssertNotNil(person.firstName, "person's first name property cannot be created")
    }
    
    func testLastName() {
        XCTAssertNotNil(person.lastName, "person's last name property cannot be created")
    }
    
    func testImageName() {
        XCTAssertNotNil(person.imageName, "person's picture property cannot be created")
    }
    
    func testTwitterHandle() {
        XCTAssertNotNil(person.twitterHandle, "person's twitter handle property cannot be created")
    }
    
    func testGithubHandle() {
        XCTAssertNotNil(person.githubHandle, "person's github handle property cannot be created")
    }
    
    func testPersonInit() {
        XCTAssertNotNil(person, "person cannot be created")
    }
    
    func testFullName() {
        var first = "Doug"
        var last = "Baldwin"
        
//        var person = Person(firstName: first, lastName: last, picture: UIImage(named: "blankface"  ))
        var person = Person(firstName: "Russell", lastName: "Wilson", imageName: "blankface", twitterHandle: "@ruswil", githubHandle: "ruwilson")
        
//        XCTAssertEqual(person.fullName(), first + last, "full name is not matching")
    }
    
    func testArrayOfPersonsCreation() {
        XCTAssertNotNil(classRoster, "array of persons cannot be created")
    }
    
    func testArrayOfPersonsFromPListCreation() {
        XCTAssertNotNil(classRosterFromPList, "array of persons cannot be created")
    }
}
