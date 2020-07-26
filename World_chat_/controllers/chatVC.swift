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
        
        navigationItem.title = currentuser?.displayName
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
    
    //MARK: - setup UI method
    
    
    func setupUI(){
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // registered customtableview cell and then move to tableview data source method cellforrowAt
        // and assign it as customMessage Cell
        
        tableView.register(UINib(nibName: Messages.cellNibName, bundle: nil), forCellReuseIdentifier: Messages.CellIdentifier)
        
        navigationItem.hidesBackButton = true
        
        loadMessages()
        
        
        
    }
    

    //MARK: - UIfunctions
    
    
    
    @IBAction func send_Message_Pressed(_ sender: Any) {
        
        sendMessages()
    
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
