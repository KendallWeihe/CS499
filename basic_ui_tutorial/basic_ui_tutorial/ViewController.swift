//
//  ViewController.swift
//  basic_ui_tutorial
//
//  Created by Kendall Weihe on 10/15/16.
//  Copyright © 2016 Kendall Weihe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,
                        UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    // MARK: ADDING OUTLINE ELEMENTS:
    @IBOutlet weak var nameTExtField: UITextField!
    @IBOutlet weak var mealLabelField: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    // MARK: ADDING ACTION ELEMENTS:
    @IBAction func setDefaultLabelText(sender: UIButton) {
        mealLabelField.text = "Default Text"
    }
    
    @IBAction func selectImageFromPhotoLibrary(sender: AnyObject) {
        // Hide the keyboard.
        nameTExtField.resignFirstResponder()
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
    
        presentViewController(imagePickerController, animated: true, completion: nil)

    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealLabelField.text = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
        
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTExtField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

