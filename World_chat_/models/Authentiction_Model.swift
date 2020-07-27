//
//  Authentiction_Model.swift
//  World_chat_
//
//  Created by Ravi Thakur on 24/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import Foundation
import FirebaseAuth


struct Authentiction_Model {
    
    //MARK: - register user
    
    func registeruser(email: String, password: String, name: String, controller: UIViewController){
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if error == nil{
                
                print("Sucessfully registered user")
                
                let updateprofile =  Auth.auth().currentUser?.createProfileChangeRequest()
                updateprofile?.displayName = name
                updateprofile?.commitChanges(completion: { (error) in
                    if error != nil{
                        
                        print("error updating name but sucessfully registered user")
                        
                        
                    }else{
                        
                        print("Sucessfully updated user")
                    }
                    
                })
                controller.navigationController?.popViewController(animated: true)
            }else{
                
                print("Did not register user")
                
            }
        }
        
    }
    
    
    //MARK: - signin user
    
    
    func signinuser(email:String , password: String, controller: UIViewController){
        
        
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            
            if error == nil{
                print("Sucessfully signed in user")
                controller.navigationItem.title = Auth.auth().currentUser?.displayName
                controller.performSegue(withIdentifier: "home", sender: nil)
                controller.showToast(message: "Sucessfully signed In", font: .systemFont(ofSize: 14), backcolor: UIColor(named: "RecieverColor")!)
                
            }
            else{
                controller.showToast(message: "Sorry Please SignIn again", font: .systemFont(ofSize: 14), backcolor: .red)
                
            }
        }
        
        
        
        
        
    }
    
    
    //MARK: - cheackuserauthstate
    
    func cheackuserAuthState() -> Bool{
        
        if Auth.auth().currentUser != nil{
            
            
            return true
            
        }else{
            
            
            return false
            
        }
    }
    
    
    func sendMessage(state: Bool) -> Bool{
        
        if state == true{
            return true
        }else{
            return false
        }
    }
    
    
    
}
