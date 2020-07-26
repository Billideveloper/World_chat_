//
//  MessageCell.swift
//  World_chat_
//
//  Created by Ravi Thakur on 24/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
  
    
    @IBOutlet weak var anotheruserImage: UIImageView!
    
    @IBOutlet weak var anotherUserName: UILabel!
    
    @IBOutlet weak var leftUserView: UIView!
    
    @IBOutlet weak var lview: UIStackView!
    
    @IBOutlet weak var rview: UIStackView!
    
    @IBOutlet weak var rightUserView: UIView!
    
    @IBOutlet weak var loggedInUserImage: UIImageView!
    
    @IBOutlet weak var loggedInUserName: UILabel!
    
    @IBOutlet weak var message_Background: UIView!
    
    @IBOutlet weak var message: UILabel!
    
    
    
    //MARK: - view methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
