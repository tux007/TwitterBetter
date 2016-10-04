//
//  RegisterVC.swift
//  TwitterBetter
//
//  Created by tom on 02.10.16.
//  Copyright © 2016 tom. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    // UI objects
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var firstnameTxt: UITextField!
    @IBOutlet weak var lastnameTxt: UITextField!
    
    
    // first func after loading the app
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // register button clicked
    @IBAction func register_clicked(_ sender: AnyObject) {
        
        // if no text entered
        if usernameTxt.text!.isEmpty || passwordTxt.text!.isEmpty || emailTxt.text!.isEmpty || firstnameTxt.text!.isEmpty || lastnameTxt.text!.isEmpty {
            
            // red placeholders
            usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSForegroundColorAttributeName:UIColor.red])
            passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSForegroundColorAttributeName:UIColor.red])
            emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSForegroundColorAttributeName:UIColor.red])
            firstnameTxt.attributedPlaceholder = NSAttributedString(string: "firstname", attributes: [NSForegroundColorAttributeName:UIColor.red])
            lastnameTxt.attributedPlaceholder = NSAttributedString(string: "lastname", attributes: [NSForegroundColorAttributeName:UIColor.red])
           
        // if text is entered
        } else {
            
            // create user in mySQL DB
            
            
        }
    }
    
}

