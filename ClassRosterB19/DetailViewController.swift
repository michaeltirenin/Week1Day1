//
//  DetailViewController.swift
//  ClassRosterB19
//
//  Created by Michael Tirenin on 7/22/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    var person : Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Details"
        
        firstNameTextField.text = person.firstName
        lastNameTextField.text = person.lastName
//        pictureImageView.image = UIImage(named: person.imageName)
        
        if person.imageName == "" {
            pictureImageView.image = UIImage(named: "blankface")
        } else {
            pictureImageView.image = UIImage(named: person.imageName)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        person.firstName = firstNameTextField.text
        person.lastName = lastNameTextField.text
    }
}
