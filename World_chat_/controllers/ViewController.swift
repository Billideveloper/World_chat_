//
//  ViewController.swift
//  World_chat_
//
//  Created by Ravi Thakur on 22/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var welcome_Action: UILabel!
    
    @IBOutlet weak var continue_btn: UIButton!
    
    @IBOutlet weak var account_info: UILabel!
    
    
    //MARK: - variable and contants
    
    
    var design = UIObjectsdesigns()
    
    var authUser = Authentiction_Model()
    
    
    //MARK: - viewdidload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        navigationItem.title = Auth.auth().currentUser?.displayName
    
        
        setupUI()
        settapgesture()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

    
    //MARK: - setupUI Method
    
    
    func setupUI(){
        
       welcome_Action.attributedText = design.setlabeltext(title: "Login Here", subtitle: "\nPlease enter your registered email Id and Password in order to continue with us!\n")
        email.setIconleft(UIImage(named: "mail_icon")!)
        
        password.setIconleft(UIImage(named: "passwordicon")!)
        
        email.setborder()
        password.setborder()
        
        continue_btn.setbutton(.black)
        
        account_info.attributedText = design.setcustomlabel(title: "Don't have Account", subtitle: "   Register here ", titlefont: 14, subtitlefont: 12, titlecolor: .black, subtitlecolor: UIColor(white: 0, alpha: 0.45))
        
        account_info.textAlignment = .center
        

    }
    
    
    
    
    @IBAction func signInUser(_ sender: Any) {
        
        
        if let email = email.text , let password = password.text{
            
            authUser.signinuser(email: email, password: password, controller: self)
        }
        
    }
    
    
    
    
    
    

}

