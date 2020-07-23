//
//  extension_textfield.swift
//  World_chat_
//
//  Created by Ravi Thakur on 22/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import UIKit


    //MARK: - custom textfield extension

    extension UITextField{
        
        func setIconleft(_ image: UIImage) {
            let iconView = UIImageView(frame:
                CGRect(x: 15, y: 4, width: 20, height: 20))
            iconView.image = image
            let iconContainerView: UIView = UIView(frame:
                CGRect(x: 20, y: 0, width: 40, height: 30))
            iconContainerView.addSubview(iconView)
            leftView = iconContainerView
            leftViewMode = .always
        }
        
        func setIconright(_ image: UIImage) {
            let iconView = UIImageView(frame:
                CGRect(x: 10, y: 4, width: 20, height: 20))
            iconView.image = image
            let iconContainerView: UIView = UIView(frame:
                CGRect(x: 20, y: 0, width: 30, height: 30))
            iconContainerView.addSubview(iconView)
            rightView = iconContainerView
            rightViewMode = .always
        }
        
        func setborder(){
            self.layer.cornerRadius = self.layer.frame.height / 3
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.black.cgColor
        }
        
        func setalert(_ color: UIColor){
            self.layer.cornerRadius = self.layer.frame.height / 3
            self.layer.borderWidth = 1
            self.layer.borderColor = color.cgColor
            
        }
        
    }
    //MARK: - Custom button extension

    extension UIButton{
        
        
        func setAlert(_ color: UIColor){
            
            self.tintColor = color
            self.layer.borderWidth = 2
            self.layer.borderColor = color.cgColor
        }
        
        func setbutton(_ color: UIColor){
            
            self.layer.cornerRadius = self.layer.frame.height / 3
            self.layer.borderWidth = 1
            self.layer.borderColor = color.cgColor
            self.layer.backgroundColor = color.cgColor
            
        }
        
        func setIconleft(_ image: UIImage) {
                   let iconView = UIImageView(frame:
                       CGRect(x: 10, y: 4, width: 20, height: 20))
                   iconView.image = image
                   let iconContainerView: UIView = UIView(frame:
                       CGRect(x: 20, y: 0, width: 30, height: 30))
                   iconContainerView.addSubview(iconView)
                   
               }
        
        
        func setbuttonIcon(_ image: UIImage,_ color: UIColor){
            
            
            self.setImage(image, for: .normal)
            
            self.imageView?.contentMode = .scaleAspectFit
            
            self.tintColor = color
        
            self.imageEdgeInsets = UIEdgeInsets(top: 12, left: -15, bottom: 12, right: 0)
            
        }
        
        
    }



    extension ViewController: UITextFieldDelegate{
        
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            
            self.email.becomeFirstResponder()
        }
        
        
        @objc func labeltapped(_ sender: UITapGestureRecognizer){
            
            self.performSegue(withIdentifier: "Register", sender: nil)
            
        }
        
        func settapgesture(){
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.labeltapped(_:)))
            self.account_info.isUserInteractionEnabled = true
            self.account_info.addGestureRecognizer(tap)
            
        }
        
        
        
        
        
    }



