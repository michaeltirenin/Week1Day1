//
//  ViewController.swift
//  ClassRosterB19
//
//  Created by Michael Tirenin on 7/21/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var people = Person.arrayOfPersonsFromPList()
    
    @IBOutlet var tableView: UITableView! // possible bug in beta4? - had to declare as strong
    // optional since not set immediately
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        arrayOfPersons()
//        arrayOfPersonsFromPList()
//        self.tableView! // manually set datasource and delegate
        tableView?.reloadData()
        
        navigationItem.title = "Class Roster"
        
        navigationItem.leftBarButtonItem = editButtonItem()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addPersonBarButtonItem") // action refers to method name
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // not used; plist used instead
//    var classRoster = []
//
//    func arrayOfPersons() {
//        let person1 = Person(firstName: "Victor", lastName: "Adu")
//        let person2 = Person(firstName: "Collin", lastName: "Atherton")
//        let person3 = Person(firstName: "John", lastName: "Clem")
//        let person4 = Person(firstName: "Jeff", lastName: "Gayle")
//        let person5 = Person(firstName: "Dan", lastName: "Hoang")
//        let person6 = Person(firstName: "Brad", lastName: "Johnson")
//        let person7 = Person(firstName: "Leonardo", lastName: "Lee")
//        let person8 = Person(firstName: "Alex", lastName: "Rice")
//        let person9 = Person(firstName: "Kirby", lastName: "Shabaga")
//        let person10 = Person(firstName: "Mike", lastName: "Tirenin")
//        
//        classRoster = [person1, person2, person3, person4, person5, person6, person7, person8, person9, person10]
//        
////        println(classRoster)
//    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PersonTableViewCell
        let personForRow = people[indexPath.row]
        
        cell.firstNameLabel.text = personForRow.firstName
        cell.lastNameLabel.text = personForRow.lastName
        
        cell.pictureImageView.image = personForRow.picture

        // sets image view properties; best place to put this?
        cell.pictureImageView.layer.cornerRadius = 10
        cell.pictureImageView.layer.masksToBounds = true
        cell.pictureImageView.layer.borderWidth = 1.2
        cell.pictureImageView!.layer.borderColor = UIColor.grayColor().CGColor
        
        cell.twitterHandleLabel.text = personForRow.twitterHandle
        cell.githubHandleLabel.text = personForRow.githubHandle
        
        return cell
    }
    
    // segues removed; see below
//    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//        if segue.identifier == "ShowDetail" {
//            let destination = segue.destinationViewController as DetailViewController
//            destination.person = people[tableView!.indexPathForSelectedRow().row]
////            println(tableView!.indexPathForSelectedRow().row)
//        } else if segue.identifier == "ShowNewPerson" {
//            let destination = segue.destinationViewController as DetailViewController
//            let newPerson = Person(firstName: "", lastName: "", imageName: "", twitterHandle: "", githubHandle: "")
//            people.append(newPerson)
//            destination.person = newPerson
//        }
//    }
    
    // used instead of segues/prepareForSegue:
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
//        println(indexPath.row)
        let detail = self.storyboard.instantiateViewControllerWithIdentifier("detail") as DetailViewController
        
        detail.person = self.people[indexPath.row]
        
        if self.navigationController {
            self.navigationController.pushViewController(detail, animated: true)
        }
    }
    
//    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
    
    // Tableview editing (from Apple's doc); this wouldn't be necessary if UITableViewVC was used instead
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        tableView.setEditing(editing, animated: true)
    }
    
    // Override to support editing the table view
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            people.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Override to support rearranging the table view.
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath:NSIndexPath) {
        var cellToMove = people[sourceIndexPath.row]
        people.removeAtIndex(sourceIndexPath.row)
        people.insert(cellToMove, atIndex: destinationIndexPath.row)
    }
    
    func addPersonBarButtonItem() {
        let detail = self.storyboard.instantiateViewControllerWithIdentifier("detail") as DetailViewController
        
        let newPerson = Person(firstName: "", lastName: "", imageName: "", twitterHandle: "", githubHandle: "")
        people.append(newPerson)
        detail.person = newPerson
        
        self.navigationController.pushViewController(detail, animated: true)
    }
}