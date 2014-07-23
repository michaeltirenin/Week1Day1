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
    
    @IBOutlet var tableView: UITableView! // possible bug in beta4 - had to declare as strong
    // optional since not set immediately
    
    @IBAction func addPersonBarButtonItem(sender: UIBarButtonItem) {

        let detail = self.storyboard.instantiateViewControllerWithIdentifier("detail") as DetailViewController

        let newPerson = Person(firstName: "", lastName: "", imageName: "", twitterHandle: "", githubHandle: "")
        people.append(newPerson)
        detail.person = newPerson

        self.navigationController.pushViewController(detail, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        arrayOfPersons()
//        arrayOfPersonsFromPList()
//        self.tableView! // manually set datasource and delegate
        tableView?.reloadData()
        
        navigationItem.title = "Class Roster"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    var classRoster = []
//
//    func arrayOfPersons() {
//        
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let personForRow = people[indexPath.row]
        cell.textLabel.text = personForRow.firstName
        cell.detailTextLabel.text = personForRow.lastName
//        cell.imageView.image = UIImage(named: "miketirenin")
//        cell.imageView.image = UIImage(named: personForRow.imageName)
        
        if personForRow.imageName == "" {
            cell.imageView.image = UIImage(named: "blankface.png")
        } else {
            cell.imageView.image = UIImage(named: personForRow.imageName)
        }
        
        return cell
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//        
//        if segue.identifier == "ShowDetail" {
//            let destination = segue.destinationViewController as DetailViewController
//            destination.person = people[tableView!.indexPathForSelectedRow().row]
////            println(tableView!.indexPathForSelectedRow().row)
//
//        } else if segue.identifier == "ShowNewPerson" {
//            let destination = segue.destinationViewController as DetailViewController
//            let newPerson = Person(firstName: "", lastName: "", imageName: "", twitterHandle: "", githubHandle: "")
//            people.append(newPerson)
//            destination.person = newPerson
//        }
//    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println(indexPath.row)
        
        let detail = self.storyboard.instantiateViewControllerWithIdentifier("detail") as DetailViewController
        
        detail.person = self.people[indexPath.row]
        
        if self.navigationController {
            self.navigationController.pushViewController(detail, animated: true)
        }
    }
}