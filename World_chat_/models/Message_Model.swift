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


struct Message_action {
    
    let db = Firestore.firestore()
    
    
    
    func deletdoc(field: String,value: Double){
        
        self.db.collection(F.WorldMessages).whereField(field, isEqualTo: value).addSnapshotListener { (snapshot, error) in
            if error != nil{
                print(error?.localizedDescription as Any)
            }
            
            
            if let snapdocs = snapshot?.documents{
                
                
                for doc in snapdocs{
                    let doc_Id = doc.documentID
                    
                    
                    self.db.collection(F.WorldMessages).document(doc_Id).delete { (error) in
                        print("deleted sucessfully")
                    }
                }
                
            }
            
        }
        
        
        
    }
    
    
}

