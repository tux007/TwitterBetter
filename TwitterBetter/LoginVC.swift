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

            // remove keyboard
            self.view.endEditing(true)
            
            // shortcuts
            let username = usernameTxt.text!.lowercased()
            let password = passwordTxt.text!
            
            // send request to mysql db
            // url to access our php file
            let url = NSURL(string: "http://localhost/TwitterBetter/login.php")!
            
            // request url
            // let request = NSMutableURLRequest(url: url as URL)
            var request = URLRequest(url: url as URL)
            
            // method to pass data POST - cause it is secured
            request.httpMethod = "POST"
            
            // body gonna be appended to url
            let body = "username=\(username)&password=\(password)"
            
            // append body to our request that gonna be sent
            request.httpBody = body.data(using: String.Encoding.utf8)
            
            // launch session
            // NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data:NSData?, response:NSURLResponse?, error:NSError?) in
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
                // no error
                if error == nil {
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                        
                        guard let parseJSON = json else {
                            print("Error while parsing")
                            return
                        }
                        
                        print(parseJSON)
                        
                        let id = parseJSON["id"] as? String
                        
                        if id != nil {
                            
                            // Successfully logged in
                        
                        }
                    
                        } catch {
                        
                            print("Caught an error: \(error)")
                        }
                    
                } else {
                    print("Error: \(error)")
                    
                }
                
            }).resume()
    
        }
    }

}
