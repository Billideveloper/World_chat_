//
//  customUIIcons.swift
//  World_chat_
//
//  Created by Ravi Thakur on 22/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import UIKit

struct UIObjectsdesigns {
    
    func setlabeltext(title: String, subtitle:String) -> NSMutableAttributedString{
        
        
        let titleattribute = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor: UIColor.black])
        
        let subtitleattribute = NSMutableAttributedString(string: subtitle, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.45)])
        
        titleattribute.append(subtitleattribute)
        
        let paragraphstyle = NSMutableParagraphStyle()
        
        paragraphstyle.lineSpacing = 5
        
        
        titleattribute.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphstyle, range: NSMakeRange(0, titleattribute.length))
        
        return titleattribute
        
    }
    
    
    
    func setcustomlabel(title: String, subtitle: String, titlefont: Int , subtitlefont: Int, titlecolor: UIColor, subtitlecolor: UIColor) -> NSMutableAttributedString{
        
        
        let titleattribute = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.init(name: "Didot", size: CGFloat(titlefont))!, NSAttributedString.Key.foregroundColor: titlecolor])
               
              
        let subtitleattribute = NSMutableAttributedString(string: subtitle, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: CGFloat(subtitlefont)), NSAttributedString.Key.foregroundColor: subtitlecolor])
        
         titleattribute.append(subtitleattribute)
        
        
        return titleattribute
        
    }
    
    

}
