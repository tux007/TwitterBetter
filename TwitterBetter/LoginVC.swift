//
//  LoginVC.swift
//  TwitterBetter
//
//  Created by tom on 12.10.16.
//  Copyright © 2016 tom. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    // UI objects
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // Clicked login button
    @IBAction func login_click(_ sender: AnyObject) {
        
        // if no text entered
        if usernameTxt.text!.isEmpty || passwordTxt.text!.isEmpty {
            
            // show red placeholders
            usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSForegroundColorAttributeName: UIColor.red])
            passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSForegroundColorAttributeName: UIColor.red])
            
        } else {
            
            // Send request to mysql db
            
            
        }
        
        
        
    }
    

}
