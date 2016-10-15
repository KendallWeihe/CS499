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
    @IBOutlet weak var disconnectButton: UIButton!
    @IBOutlet weak var statusText: UILabel!
    
    // [START viewdidload]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // [START_EXCLUDE]
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(ViewController.receiveToggleAuthUINotification(_:)),
                                                         name: "ToggleAuthUINotification",
                                                         object: nil)
        
        statusText.text = "Initialized Swift app..."
        toggleAuthUI()
        // [END_EXCLUDE]
    }
    // [END viewdidload]
    
    // [START signout_tapped]
    @IBAction func didTapSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
        // [START_EXCLUDE silent]
        statusText.text = "Signed out."
        toggleAuthUI()
        // [END_EXCLUDE]
    }
    // [END signout_tapped]
    
    // [START disconnect_tapped]
    @IBAction func didTapDisconnect(sender: AnyObject) {
        GIDSignIn.sharedInstance().disconnect()
        // [START_EXCLUDE silent]
        statusText.text = "Disconnecting."
        // [END_EXCLUDE]
    }
    // [END disconnect_tapped]
    
    // [START toggle_auth]
    func toggleAuthUI() {
        if (GIDSignIn.sharedInstance().hasAuthInKeychain()){
            // Signed in
            signInButton.hidden = true
            signOutButton.hidden = false
            disconnectButton.hidden = false
        } else {
            signInButton.hidden = false
            signOutButton.hidden = true
            disconnectButton.hidden = true
            statusText.text = "Google Sign in\niOS Demo"
        }
    }
    // [END toggle_auth]
    
    // Implement these methods only if the GIDSignInUIDelegate is not a subclass of
    // UIViewController.
    
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
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

