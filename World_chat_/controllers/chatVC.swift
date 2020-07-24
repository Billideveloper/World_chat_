//
//  chatVC.swift
//  World_chat_
//
//  Created by Ravi Thakur on 24/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import UIKit
import Firebase

class chatVC: UIViewController {
    
    let currentuser = Auth.auth().currentUser

    var authUser = Authentiction_Model()
    
    //MARK: - view methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.isNavigationBarHidden = false
        setupUI()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("we are at chatVC")
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
        
        navigationItem.hidesBackButton = true
        navigationItem.title = currentuser?.displayName
        
        
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
