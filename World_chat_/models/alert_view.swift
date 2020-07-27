//
//  alert-view.swift
//  World_chat_
//
//  Created by Ravi Thakur on 27/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import UIKit
import UserNotifications

struct alert_view {
    
    
    func shownotification(mtitle: String, mbody : String){
        
        
        
        //ask permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:
        [.badge,.sound, .alert]) { (permission, error) in
            if error != nil{
                print("permission not given")
            }
        }
        
        //content
        
        let content = UNMutableNotificationContent()
        content.body = "\(mbody)"
        content.title = "\(mtitle)"
        
        //trigger notification
        
        let date = Date().addingTimeInterval(10)
        
        let datecomponent = Calendar.current.dateComponents([ .year, .month ,.day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: datecomponent, repeats: false)
        
        
        //request
        
        let uuid = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        //register
        
        
        center.add(request) { (error) in
            if error != nil{
                
                print("Sorry can't send notifications")
            }
        }
        
    }
    
    
    
}
