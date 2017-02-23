//
//  ChatViewController.swift
//  Parse_SHurtado
//
//  Created by Steven Hurtado on 2/22/17.
//  Copyright © 2017 Steven Hurtado. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var messageArray: [String]! = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.definesPresentationContext = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 120
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print("\(messageArray.count)")
        
        if(messageArray != nil)
        {
            return messageArray.count
        }
        else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageCell
        
        cell.cellLabel.text = messageArray[indexPath.row]
        
        
        return cell
    }
    
    @IBAction func chatBtnPressed(_ sender: Any)
    {
        let chatMessage = PFObject(className: "Message")
        
        if(userTextField.text! != "")
        {
            chatMessage["text"] = userTextField.text!
            
            chatMessage.saveInBackground { (success: Bool, error: Error?) in
                
                if(success)
                {
                    
                    self.messageArray.append(chatMessage["text"] as! String)
                    
                    self.tableView.reloadData()
                }
                else
                {
                    if let errorString = error!.localizedDescription as? String
                    {
                        Util.invokeAlertMethod("Error", strBody: errorString as NSString, delegate: self)
                    }
                }
            }
        }
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
