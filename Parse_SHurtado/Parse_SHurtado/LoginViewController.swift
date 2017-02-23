//
//  LoginViewController.swift
//  Parse_SHurtado
//
//  Created by Steven Hurtado on 2/22/17.
//  Copyright © 2017 Steven Hurtado. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController
{

    @IBOutlet weak var emailTextField: UITextField!
    var email : String!
    
    @IBOutlet weak var passTextField: UITextField!
    var pass : String!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signUpPressed(_ sender: Any)
    {
        let user = PFUser()
        
        user.username = emailTextField.text!
        user.password = passTextField.text!
        
        user.signUpInBackground(block: {
            (succeeded: Bool, error: Error?) in
            if let error = error
            {
                let errorString = error.localizedDescription as? NSString
                
                self.displayAlert("Error:", message: errorString as! String)
            }
            else
            {
                // Hooray! Let them use the app now.
                let alert = UIAlertController(title: "Success!", message: "You now have an account.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction((UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    self.dismiss(animated: true, completion: nil)
                    
                    self.performSegue(withIdentifier: "mainSegue", sender: self)
                })))
                
                self.present(alert, animated: true, completion: nil)
            }
        })
        
    }
    
    @IBAction func loginPressed(_ sender: Any)
    {

        PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passTextField.text!, block: { (user, error) in
            
            if ((user) != nil) {
                let alert = UIAlertController(title: "Success!", message: "You're logged in.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction((UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    self.dismiss(animated: true, completion: nil)
                    
                    self.performSegue(withIdentifier: "mainSegue", sender: self)
                })))
                
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
        
                if let errorString = error!.localizedDescription as? String
                {
                    self.displayAlert("Error:", message: errorString)
                }
            }
            
        })
    }
    
    func displayAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction((UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            self.dismiss(animated: true, completion: nil)
        })))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning()
    {
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
