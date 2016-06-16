//
//  ViewController.swift
//  LocalNotificationSample
//
//  Created by Anish on 6/14/16.
//  Copyright © 2016 Anish. All rights reserved.
//

import UIKit
import  UserNotifications
import UserNotificationsUI //framework to customize the notification

class ViewController: UIViewController {
   
    let requestIdentifier = "SampleRequest"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction  func triggerNotification(){
        
        let content = UNMutableNotificationContent()
        content.title = "Intro to Notifications"
        content.subtitle = "Lets code,Talk is cheap"
        content.body = "Sample code from WWDC"
        content.sound = UNNotificationSound.default()

        // Deliver the notification in five seconds.
      
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 1.0, repeats: false)
        let request = UNNotificationRequest(identifier:requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request){(error) in
            
            if (error != nil){
            
                //handle here
            
            }
            
        }
    
        
    }

    @IBAction func stopNotification(_ sender: AnyObject) {
        
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [requestIdentifier])

        
    }
    


}

extension ViewController:UNUserNotificationCenterDelegate{


    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: () -> Void) {
        
        print("Tapped in notification")
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        
        print("Notification being triggered")
        //You can either present alert ,sound or increase badge while the app is in foreground too with ios 10
        //to distinguish between notifications
        if notification.request.identifier == requestIdentifier{
        
         completionHandler( [.alert,.sound])
        
       
        
        }
        
    }
  
}
