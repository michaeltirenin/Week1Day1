//
//  DetailViewController.swift
//  ClassRosterB19
//
//  Created by Michael Tirenin on 7/22/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITraitEnvironment {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var twitterHandleTextField: UITextField!
    @IBOutlet weak var githubHandleTextField: UITextField!
    
    @IBOutlet weak var pictureButton: UIButton!
    
// outlets of constraints; used to split view (move objects) in landscape mode
    @IBOutlet weak var firstNameCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var firstNameTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageButtonCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageButtonTopConstraint: NSLayoutConstraint!
    
    var person : Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Details"
        
        firstNameTextField.text = person.firstName
        lastNameTextField.text = person.lastName
        
        if person.imageName == "" {
            pictureButton.setBackgroundImage(UIImage(named: "blankface"), forState: .Normal)
            person.imageName = "blankface"
        } else {
            pictureButton.setBackgroundImage(person.picture, forState: .Normal)
        }

        twitterHandleTextField.text = person.twitterHandle
        githubHandleTextField.text = person.githubHandle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//       self.pictureButton.layer.cornerRadius = 0.5 * self.pictureButton.frame.width // circular frame example
        self.pictureButton.layer.cornerRadius = 10
        self.pictureButton.layer.masksToBounds = true
        self.pictureButton.layer.borderWidth = 1.5
        self.pictureButton.layer.borderColor = UIColor.grayColor().CGColor
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        person.firstName = firstNameTextField.text
        person.lastName = lastNameTextField.text
        person.twitterHandle = twitterHandleTextField.text
        person.githubHandle = githubHandleTextField.text
        person.picture = pictureButton.backgroundImageForState(.Normal)
    }
    
    func textFieldDidBeginEditing(textField: UITextField!) {
        if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Regular {
            let currentWidth = self.view.bounds.width
            let currentHeight = self.view.bounds.height
            //        let newY = self.view.bounds.origin.y + textField.frame.origin.y - 100
            let newY = 0 + textField.frame.origin.y - 132
            let currentX = self.view.bounds.origin.x
            
            UIView.animateWithDuration(0.3, animations:{ () -> Void
                in
                self.view.bounds = CGRect(x: currentX, y: newY, width: currentWidth, height: currentHeight)
                })
        } else if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Compact {
            let currentWidth = self.view.bounds.width
            let currentHeight = self.view.bounds.height
            //        let newY = self.view.bounds.origin.y + textField.frame.origin.y - 100
            let newY = 0 + textField.frame.origin.y - 65
            let currentX = self.view.bounds.origin.x
            
            UIView.animateWithDuration(0.3, animations:{ () -> Void
                in
                self.view.bounds = CGRect(x: currentX, y: newY, width: currentWidth, height: currentHeight)
                })
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField!) {
        let currentWidth = self.view.bounds.width
        let currentHeight = self.view.bounds.height
       
        UIView.animateWithDuration(0.3, animations:{ () -> Void
            in
            
            self.view.bounds = CGRect(x: 0, y: 0, width: currentWidth, height: currentHeight)
            })
        
// variation of above
//        UIView.animateWithDuration(0.3) {
//            self.view.bounds = CGRect(x: 0, y: 0, width: currentWidth, height: currentHeight)
//        }
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }

// resigns keyboard if any touch happens in white space
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        for control in self.view.subviews {
            if let theControl = control as? UITextField {
                theControl.resignFirstResponder()
            }
        }
    }
    
    @IBAction func editPictureButton(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func showImagePickerBarButton(sender: UIBarButtonItem) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        var pickedImage = info[UIImagePickerControllerOriginalImage] as UIImage
        pictureButton.setBackgroundImage(pickedImage, forState: .Normal)
        person.picture = pickedImage
        UIImageWriteToSavedPhotosAlbum(pickedImage, nil, nil, nil)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // used to translate objects via constraint constants
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection!) {
//        println(self.traitCollection.verticalSizeClass.toRaw())
        
//        println(self.imageButtonTopConstraint.constant) // used as 'return to compact state' value
//        println(self.imageButtonCenterConstraint.constant)
//        println(self.firstNameTopConstraint.constant)
//        println(self.firstNameCenterConstraint.constant)

        if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Compact {
            self.imageButtonTopConstraint.constant = 50
            self.imageButtonCenterConstraint.constant = 130
            self.firstNameTopConstraint.constant = 35
            self.firstNameCenterConstraint.constant = -90
        } else if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Regular {
            self.imageButtonTopConstraint.constant = 19
            self.imageButtonCenterConstraint.constant = 0
            self.firstNameTopConstraint.constant = 176
            self.firstNameCenterConstraint.constant = 0
        }
    }
}