//
//  chatVCExtension.swift
//  World_chat_
//
//  Created by Ravi Thakur on 24/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import UIKit
import FirebaseAuth



extension chatVC: UITableViewDataSource{
    
    //MARK: -  load messages from firestore method
    
    func loadMessages(){
        
        
        if Auth.auth().currentUser != nil{
            
            db.collection(F.WorldMessages).order(by: F.MessageDate).addSnapshotListener{ (Msanpshot, error) in
                
                self.messages = []
                
                if error != nil{
                    
                    print("Sorry Can't Load Messages")
                    print(error?.localizedDescription as Any)
                    
                }
                
                if let snapsdocs = Msanpshot?.documents{
                    
                    for doc in snapsdocs{
                    
                        let data = doc.data()
                        
                        if let senderName = data[F.senderName] as? String
                            ,let senderEmail = data[F.senderEmail] as? String
                            ,let message = data[F.Message_body] as? String
                            ,let messageDate = data[F.MessageDate] as? Double,
                            let messageSender = data[F.SenderID] as? String{
                            
                            let newMessage = Message(senderName: senderName, senderEmail: senderEmail, senderMessage: message, senderDate: messageDate, senderID: messageSender)
                            
                            self.messages.append(newMessage)
                            
                            
                            DispatchQueue.main.async {
                                
                                self.tableView.reloadData()
                            
                                
                                self.scroll()
                            }
                            
                            
                        }
                        
                    }
                    
                }
                
                
            }
        } else{
            print("Please SignIn Again")
        }
        
    }
    
    //MARK: - send message method
    
    
    func sendMessages(){
        
        
        if let message = messagefield.text , let sendername = Auth.auth().currentUser?.displayName , let senderemail = Auth.auth().currentUser?.email, let senderID = currentuser?.uid{
            
            
            let mymessagedata = [F.senderName: sendername, F.senderEmail :senderemail,
                                 F.MessageDate: Date().timeIntervalSince1970, F.Message_body : message,
                                 F.SenderID: senderID 
                ] as [String : Any]
            
            
            db.collection(F.WorldMessages).addDocument(data: mymessagedata) { (error) in
                
                if let e = error{
                    print(e.localizedDescription)
                }else{
                    
                    func messagestate() -> Bool{
                        return true
                    }
                    DispatchQueue.main.async {
                        
                        self.messagefield.text = ""
                    
                    
                    }
                }
                
            }
        }
        
    }
    
    
    //MARK: - tableview methods
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let row = self.messages.count
        return row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Messages.CellIdentifier , for: indexPath) as! MessageCell
        
        var Mindexpath: IndexPath?{
               return self.tableView.indexPath(for: cell)
           }
        
        if message.senderEmail == currentuser?.email{
            
            cell.rightUserView.isHidden = false
            cell.leftUserView.isHidden = true
            //cell.message.textAlignment = .right
            cell.loggedInUserName.text = message.senderName
            cell.message_Background.backgroundColor = UIColor(named: "RecieverColor")
            
            
        }else{
            cell.leftUserView.isHidden = false
            cell.rightUserView.isHidden = true
            //cell.message.textAlignment = .left
            cell.anotherUserName.text = message.senderName
            cell.message_Background.backgroundColor = UIColor(named: "senderColor")
            
        }
        
        cell.message.text = message.senderMessage
        
        return cell
        
    }
    
    
}

extension chatVC: UITableViewDelegate{
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let delet = deletmsg(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [delet])
    }
    
    func deletmsg(at indexPath: IndexPath) -> UIContextualAction{
        
        var action = UIContextualAction()
        
        let message = messages[indexPath.row]
        
        if currentuser?.email == message.senderEmail{
            
            action = UIContextualAction(style: .normal, title: "delet") { (action, view, completion) in
                
                //MARK: - delet method
                self.messageAction.deletdoc(field: F.MessageDate, value: message.senderDate)
                
                self.messages.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                completion(true)
                
            }
            action.image = UIGraphicsImageRenderer(size: CGSize(width: 40, height: 40)).image{ _ in
                UIImage(named: "delet_btn")?.draw(in: CGRect(x: 0, y: 0, width: 35, height: 35))
            }
            
            action.backgroundColor = .white
            
        }else{
            
            action = UIContextualAction(style: .normal, title: "\(message.senderName)", handler: { (action, view, complete) in
                
            })
            action.backgroundColor = UIColor(named: "senderColor")
            
        }
        
        return action
    }
    
 
    func screolltable(indexPath: IndexPath){
        
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)

    }
    
    
    //MARK: - tableview scroll to newest message
    
    func scroll(){
           
                  if Auth.auth().currentUser != nil{
                      
                      let indexPath = NSIndexPath(row: messages.count - 1, section: 0)
                      self.tableView.scrollToRow(at: indexPath as IndexPath, at: UITableView.ScrollPosition.bottom, animated: true)
                      
                  }
       }
    
    
    //MARK: - tableview scroll to first cell at top basically for timline view
    
    
    func scrollToFirstRow() {
        let indexPath = NSIndexPath(row: 0, section: 0)
        self.tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
    }

}

