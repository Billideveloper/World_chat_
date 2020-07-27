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
    
    //MARK: - UIconnections Outlets
    
    @IBOutlet weak var registerbtn: UIButton!
    
    @IBOutlet weak var info_Label: UILabel!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var reenterpassword: UITextField!
    
    
    //MARK: - variables and constatnts
    
    
    var design = UIObjectsdesigns()
    
    var authUser = Authentiction_Model()
    
    
    //MARK: - view methods
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        

        setupUI()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
//MARK: - UIconnection Actions


    @IBAction func dismiss_VC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    
    
    @IBAction func register_User(_ sender: Any) {
        
        if let email = userEmail.text , let password = userPassword.text , let name = userName.text{
            
            if userPassword.text != reenterpassword.text{
                
                self.showToast(message: "your passwords do not match", font: .systemFont(ofSize: 12), backcolor: UIColor(named: "RecieverColor")!)
                
            }else{
                
                authUser.registeruser(email: email, password: password, name: name, controller: self)
                
            }
            
            
            
        }else{
            
            textfiledUI()
        }
        
    }
    
    //MARK: - UIMethods
    
    func setupUI(){
        
        info_Label.attributedText = design.setcustomlabel(title: "Register Here", subtitle: "", titlefont: 22, subtitlefont: 10, titlecolor: .black, subtitlecolor: .black)
        
        userEmail.setalert(UIColor(named: "RecieverColor")!)
        userName.setalert(UIColor(named: "RecieverColor")!)
        userPassword.setalert(UIColor(named: "RecieverColor")!)
        reenterpassword.setalert(UIColor(named: "RecieverColor")!)
        
        userName.setIconleft(UIImage(named: "continue_btn")!)
        
        userEmail.setIconleft(UIImage(named: "mail_icon")!)
        
        userPassword.setIconleft(UIImage(named: "passwordicon")!)
        
        reenterpassword.setIconleft(UIImage(named: "passwordicon")!)
        
        registerbtn.setbutton(UIColor(named: "RecieverColor")!)
        
    }
    
    func textfiledUI(){
        
        
        if userPassword.text != nil , reenterpassword.text != nil , userName.text != nil, userEmail != nil{
            
            if userPassword.text != reenterpassword.text {
                self.showToast(message: "please enter in all fields", font: .systemFont(ofSize: 12), backcolor: UIColor(named: "RecieverColor")!)
            }
        }
        
    }
    
    
}
