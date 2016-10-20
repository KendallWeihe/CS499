//
//  HomeViewController.swift
//  g_sign_in
//
//  Created by Kendall Weihe on 10/16/16.
//  Copyright © 2016 Kendall Weihe. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var signOut: UIButton!
    
    @IBAction func signOutGest(sender: UITapGestureRecognizer) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
