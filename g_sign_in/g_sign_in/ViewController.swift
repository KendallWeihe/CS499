//
//  ViewController.swift
//  g_sign_in
//
//  Created by Kendall Weihe on 10/15/16.
//  Copyright © 2016 Kendall Weihe. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var homeButton: UIButton!
    
    @IBAction func tappedSignIn(sender: UITapGestureRecognizer) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    @IBAction func tappedSignOut(sender: UITapGestureRecognizer) {
        GIDSignIn.sharedInstance().signOut()
        // [START_EXCLUDE silent]
        statusText.text = "Signed out."
        toggleAuthUI()
        // [END_EXCLUDE]
    }
    
    @IBAction func tappedDisconnect(sender: UITapGestureRecognizer) {
        GIDSignIn.sharedInstance().disconnect()
        // [START_EXCLUDE silent]
        statusText.text = "Disconnecting."
        // [END_EXCLUDE]
    }
    
    

    
    
    // [START toggle_auth]
    func toggleAuthUI() {
        if (GIDSignIn.sharedInstance().hasAuthInKeychain()){
            // Signed in
            signInButton.hidden = true
            signOutButton.hidden = false
            homeButton.hidden = false
            print("here")
        } else {
            signInButton.hidden = false
            signOutButton.hidden = true
            homeButton.hidden = true
            statusText.text = "Google Sign in\niOS Demo"
        }
    }
    // [END toggle_auth]

    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self,
                                                            name: "ToggleAuthUINotification",
                                                            object: nil)
    }
    
    @objc func receiveToggleAuthUINotification(notification: NSNotification) {
        if (notification.name == "ToggleAuthUINotification") {
            self.toggleAuthUI()
            if notification.userInfo != nil {
                let userInfo:Dictionary<String,String!> =
                    notification.userInfo as! Dictionary<String,String!>
                self.statusText.text = userInfo["statusText"]
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

