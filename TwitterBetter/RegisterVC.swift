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
            
            // url to php file
            let url = NSURL(string: "http://localhost/TwitterBetter/register.php")!
            
            // request to this file
            var request = URLRequest(url: url as URL)
            
            // method to pass data to this file (e.g. via POST)
            request.httpMethod = "POST"
            
            // body to be appended to url
            let body = "username=\(usernameTxt.text!.lowercased())&password=\(passwordTxt.text!)&email=\(emailTxt.text!)&fullname=\(firstnameTxt.text!)%20\(lastnameTxt.text!)"
            request.httpBody = body.data(using: String.Encoding.utf8)
            
            // proceed request
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                
                if error == nil {
                    
                    // get main queue in code process to communicate back to UI
                    DispatchQueue.main.async {
                        
                        do {
                            // get json result
                            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                            
                            // assign json to new var parseJSON in guard/secured way
                            guard let parseJSON = json else {
                                print("Error while parsing")
                                return
                            }
                            
                            // get id from parseJSON dictionary
                            let id = parseJSON["id"]
                            
                            // successfully registered
                            if id != nil {
                                
                                print(parseJSON)
                               
                                
                            }
                            
                        } catch {
                            
                            print("Caught an error: \(error)")
                            
                        }
                        
                    }
                    
                    // if unable to proceed request
                } else {
                    
                    print("error: \(error)")
                        
                    }
                
                // launch prepared session
            }).resume()
            
        }
        
        
    }
    
}



