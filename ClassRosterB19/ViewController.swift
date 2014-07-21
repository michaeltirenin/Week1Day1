//
//  ViewController.swift
//  ClassRosterB19
//
//  Created by Michael Tirenin on 7/21/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfPersons()
        arrayOfPersonsFromPList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var classRoster = []

    func arrayOfPersons() {
        
        let person1 = Person(firstName: "Victor", lastName: "Adu", picture: UIImage(named: "blankface.jpeg"))
        let person2 = Person(firstName: "Collin", lastName: "Atherton", picture: UIImage(named: "blankface.jpeg"))
        let person3 = Person(firstName: "John", lastName: "Clem", picture: UIImage(named: "blankface.jpeg"))
        let person4 = Person(firstName: "Jeff", lastName: "Gayle", picture: UIImage(named: "blankface.jpeg"))
        let person5 = Person(firstName: "Dan", lastName: "Hoang", picture: UIImage(named: "blankface.jpeg"))
        let person6 = Person(firstName: "Brad", lastName: "Johnson", picture: UIImage(named: "blankface.jpeg"))
        let person7 = Person(firstName: "Leonardo", lastName: "Lee", picture: UIImage(named: "blankface.jpeg"))
        let person8 = Person(firstName: "Alex", lastName: "Rice", picture: UIImage(named: "blankface.jpeg"))
        let person9 = Person(firstName: "Kirby", lastName: "Shabaga", picture: UIImage(named: "blankface.jpeg"))
        let person10 = Person(firstName: "Mike", lastName: "Tirenin", picture: UIImage(named: "blankface.jpeg"))
        
        classRoster = [person1, person2, person3, person4, person5, person6, person7, person8, person9, person10]
        
//        println(classRoster)
    }
    
    func arrayOfPersonsFromPList() {
        
        // set up .plist as an array
        let classRosterFromPList = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("ClassRoster", ofType: "plist"))
        
        println(classRosterFromPList)
        println(classRosterFromPList.count)
    }
}