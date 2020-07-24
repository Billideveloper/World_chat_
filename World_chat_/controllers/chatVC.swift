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
    
    
    
    
    var authUser = Authentiction_Model()
    
    //MARK: - view methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        setupUserAuthstate()
        
    }
    
    //MARK: - user Authstate
    
    
    func setupUserAuthstate(){
        
        let userState = authUser.cheackuserAuthState()
        
        if userState == true{
            
            print("User is allready logged in")
            
            self.navigationController?.popToRootViewController(animated: true)
            
        }else{
            
            print("please signIn")
            
            self.navigationController?.performSegue(withIdentifier: "signin", sender: nil)
        }
        
        
    }
    
    
  
    

}
