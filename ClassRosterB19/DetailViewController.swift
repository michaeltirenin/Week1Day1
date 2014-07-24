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
    
    @IBOutlet weak var pictureImageView: UIImageView!
    

    @IBOutlet weak var firstNameCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    var person : Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Details"
        
        firstNameTextField.text = person.firstName
        lastNameTextField.text = person.lastName
        
        if person.imageName == "" {
            pictureImageView.image = UIImage(named: "blankface")
        } else {
            pictureImageView.image = UIImage(named: person.imageName)
        }
        
        twitterHandleTextField.text = person.twitterHandle
        githubHandleTextField.text = person.githubHandle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//       self.pictureImageView!.layer.cornerRadius = 0.5 * self.pictureImageView!.frame.width
        self.pictureImageView!.layer.cornerRadius = 10
        self.pictureImageView!.layer.masksToBounds = true
        self.pictureImageView!.layer.borderWidth = 1
        self.pictureImageView!.layer.borderColor = UIColor.blueColor().CGColor
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        person.firstName = firstNameTextField.text
        person.lastName = lastNameTextField.text
        person.twitterHandle = twitterHandleTextField.text
        person.githubHandle = githubHandleTextField.text
//        person.imageName = pictureImageView.image
    }
    
    func textFieldDidBeginEditing(textField: UITextField!) {
        
        let currentWidth = self.view.bounds.width
        let currentHeight = self.view.bounds.height
//        let newY = self.view.bounds.origin.y + textField.frame.origin.y - 100
        let newY = 0 + textField.frame.origin.y - 100
        let currentX = self.view.bounds.origin.x
        
        UIView.animateWithDuration(0.3, animations:{ () -> Void
            in
            self.view.bounds = CGRect(x: currentX, y: newY, width: currentWidth, height: currentHeight)
            })
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
    
    @IBAction func showImagePickerBarButton(sender: UIBarButtonItem) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
//        println("did finish picking")
        var pickedImage = info[UIImagePickerControllerOriginalImage] as UIImage
//        pictureImageView.image = UIImage(named: pickedImage)
        pictureImageView.image = pickedImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection!) {
        println(self.traitCollection.verticalSizeClass.toRaw())
        
        println(self.imageViewTopConstraint.constant)
        println(self.imageViewCenterConstraint.constant)
        println(self.firstNameCenterConstraint.constant)
        
        if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Compact {
            
            self.imageViewTopConstraint.constant = 10.0
            self.imageViewCenterConstraint.constant = 130
            self.firstNameCenterConstraint.constant = -140
            
        }
        else if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Regular {
            
            self.imageViewTopConstraint.constant = 260
            self.imageViewCenterConstraint.constant = 0
            self.firstNameCenterConstraint.constant = 0
            
        }
    }
    
    
    
}
