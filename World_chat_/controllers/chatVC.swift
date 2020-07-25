//
//  chatVC.swift
//  World_chat_
//
//  Created by Ravi Thakur on 24/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class chatVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var messagefield: UITextField!
    
    
    @IBOutlet weak var sendMessage: UIButton!
    
    let db = Firestore.firestore()
    
    
    let currentuser = Auth.auth().currentUser
    
    var messages : [Message] = [
    ]

    var authUser = Authentiction_Model()
    
    //MARK: - view methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.isNavigationBarHidden = false
        setupUI()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        setupUserAuthstate()
        
    }
    
    //MARK: - Cheacking User Authstates
    
    
    func setupUserAuthstate(){
        
        let userState = authUser.cheackuserAuthState()
        
        if userState == true{
            
            self.navigationController?.popToRootViewController(animated: true)
            
        }else{
            
            self.performSegue(withIdentifier: "signme", sender: self)
            
        }
        
    }
    
    
    
    func setupUI(){
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // registered customtableview cell and then move to tableview data source method cellforrowAt
        // and assign it as customMessage Cell
        
        tableView.register(UINib(nibName: Messages.cellNibName, bundle: nil), forCellReuseIdentifier: Messages.CellIdentifier)
        
        navigationItem.hidesBackButton = true
        navigationItem.title = currentuser?.displayName
        
        loadMessages()
        
        
    }
    
    
    
    func loadMessages(){
        
        
        
        db.collection(F.WorldMessages).order(by: F.MessageDate).addSnapshotListener{ (Msanpshot, error) in
            
            self.messages = []
            
            if error != nil{
                
               print("Sorry Can't Load Messages")
                
            }
            
            if let snapsdocs = Msanpshot?.documents{
                
                for doc in snapsdocs{
                    
            
                    let data = doc.data()
                    
                   if let senderName = data[F.senderName] as? String
                    ,let senderEmail = data[F.senderEmail] as? String
                    ,let message = data[F.Message_body] as? String
                    ,let messageDate = data[F.MessageDate] as? Double{
                    
                    let newMessage = Message(senderName: senderName, senderEmail: senderEmail, senderMessage: message, senderDate: messageDate)
                    
                    self.messages.append(newMessage)
                    
                    
                    DispatchQueue.main.async {
                        
                        self.tableView.reloadData()
                    }
                    
                    
                    }
                    
                    
                    
                }
                
            }
        
            
        }
        
        
        
    }
    
    
    
    
    @IBAction func send_Message_Pressed(_ sender: Any) {
        
        if let message = messagefield.text , let sendername = Auth.auth().currentUser?.displayName , let senderemail = Auth.auth().currentUser?.email{
            
            
            let mymessagedata = [F.senderName: sendername, F.senderEmail :senderemail,
                                 F.MessageDate: Date().timeIntervalSince1970, F.Message_body : message
                ] as [String : Any]
            
            
            db.collection(F.WorldMessages).addDocument(data: mymessagedata) { (error) in
                
                if let e = error{
                    print(e.localizedDescription)
                }else{
                    
                    
                    DispatchQueue.main.async {
                        self.messagefield.text = ""
                    }
                }
                
                
            }
        }
        
        
        
    }
    
    
    
    
    
    
    
    @IBAction func logout_btn(_ sender: Any) {
        
            let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            
            self.performSegue(withIdentifier: "signme", sender: self)
            
        } catch let signOutError as NSError {
            
          print ("Error signing out: %@", signOutError)
        }
    }
    
  
    

}
