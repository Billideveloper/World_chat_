//
//  Message_Model.swift
//  World_chat_
//
//  Created by Ravi Thakur on 24/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore



struct Message {
    
    let senderName: String
    let senderEmail: String
    let senderMessage: String
    let senderDate: Double
    let senderID: String
    
}


let db = Firestore.firestore()


let auth = Authentiction_Model()

struct MessgaeAuth {
    
    func sendMessage(sendername: String, senderID: String, message: String, senderemail: String){
        
        let mymessagedata = [F.senderName: sendername, F.senderEmail :senderemail,
                                        
                             F.MessageDate: Date().timeIntervalSince1970, F.Message_body : message,
                                        
                             F.SenderID: senderID
                       ] as [String : Any]
        
        db.collection(F.WorldMessages).addDocument(data: mymessagedata) { (error) in
            
            if let e = error{
                
                print(e.localizedDescription)
               
                
            
            }else{
                
               
                
                
            
            }
            
            
        }

        
        
    }
    
    
    
}
