//
//  RegisterUserVC.swift
//  World_chat_
//
//  Created by Ravi Thakur on 23/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import UIKit

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
