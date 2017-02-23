//
//  MessageCell.swift
//  Parse_SHurtado
//
//  Created by Steven Hurtado on 2/22/17.
//  Copyright © 2017 Steven Hurtado. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell
{
    
    @IBOutlet weak var messageView: UIView!

    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        
        messageView.layer.shadowColor = UIColor.black.cgColor
        
        messageView.layer.shadowRadius = 10
        messageView.layer.shadowOpacity = 1.0
        messageView.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        messageView.layer.shouldRasterize = true
        
        messageView.layer.cornerRadius = 10
        
        messageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
