//
//  RegisterUserVC.swift
//  World_chat_
//
//  Created by Ravi Thakur on 23/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterUserVC: UIViewController {
    
    @IBOutlet weak var registerbtn: UIButton!
    
    @IBOutlet weak var info_Label: UILabel!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var reenterpassword: UITextField!
    
    
    
    
    var design = UIObjectsdesigns()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
      
    }
    



    @IBAction func dismiss_VC(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    @IBAction func register_User(_ sender: Any) {
        
        if let email = userEmail.text , let password = userPassword.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { (AuthResults, error) in
                
                if error != nil{
                    print("something went wrong please try again")
                }else{
                    
                   let setdiaplayname =  Auth.auth().currentUser?.createProfileChangeRequest()
                    setdiaplayname?.displayName = self.userName.text
                    
                    setdiaplayname?.commitChanges(completion: { (error) in
                        if error != nil{
                            
                            
                            print("Sorry cannot update your profile name try it again ")
                        }else{
                            
                            
                            
                            print("your profile is sucessfully updated with your name")
                        }
                    })
                    self.navigationController?.popToRootViewController(animated: true)
                }
                
            }
            
            
            
        }
        
        
        
    
        
        
        
        
        
    }
    
    
    
    func setupUI(){
        
        info_Label.attributedText = design.setcustomlabel(title: "Register Here", subtitle: "", titlefont: 22, subtitlefont: 10, titlecolor: .black, subtitlecolor: .black)
        
        userEmail.setborder()
        userName.setborder()
        userPassword.setborder()
        reenterpassword.setborder()
        
        userName.setIconleft(UIImage(named: "continue_btn")!)
        
        userEmail.setIconleft(UIImage(named: "mail_icon")!)
        
        userPassword.setIconleft(UIImage(named: "passwordicon")!)
        
        reenterpassword.setIconleft(UIImage(named: "passwordicon")!)
        
        registerbtn.setbutton(.black)
        
    }
    
    
    
    
}
