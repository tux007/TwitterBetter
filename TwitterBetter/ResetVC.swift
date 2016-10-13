//
//  ResetVC.swift
//  TwitterBetter
//
//  Created by tom on 13.10.16.
//  Copyright © 2016 tom. All rights reserved.
//

import UIKit

class ResetVC: UIViewController {
    
    // UI object
    @IBOutlet weak var emailTxt: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        }
    
    // Reset button clicked
    @IBAction func reset_click(_ sender: AnyObject) {
        
        // If no text entered
        if emailTxt.text!.isEmpty {
            
            // show red placeholders
            emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSForegroundColorAttributeName: UIColor.red])
            
        } else {
            
            // send mysql / php request
            
            
        }
        
        
        
    }

}
