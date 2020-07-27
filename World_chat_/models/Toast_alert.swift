//
//  Toast_alert.swift
//  World_chat_
//
//  Created by Ravi Thakur on 27/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import UIKit

extension UIViewController {

    func showToast(message : String, font: UIFont, backcolor: UIColor) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height-200, width: 200, height: 35))
    toastLabel.backgroundColor = backcolor.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.black
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .allowAnimatedContent, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
        
    
    })
}
    
    func returnanswer(answer: String) -> String{
        return answer
    }
    
    
    
    
}
