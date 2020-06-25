//
//  AppDelegate.swift
//  BlackLivesMatter
//
//  Created by Swetha Mohandas on 6/10/20.
//  Copyright © 2020 Sambar. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let configuration = ParseClientConfiguration {
            $0.applicationId = "rm4q0bPjhnujlTnYV6GHVVruDcwzR2NzzBenFI7z"
            $0.clientKey = "mlux1YvqIfg6LY3d5vHD72P55wan5hihvxO41F5g"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)
        saveInstallationObject()
        return true
    }
    
    func saveInstallationObject(){
            if let installation = PFInstallation.current(){
                installation.saveInBackground {
                    (success: Bool, error: Error?) in
                    if (success) {
                        print("You have successfully connected your app to Back4App!")
                    } else {
                        if let myError = error{
                            print(myError.localizedDescription)
                        }else{
                            print("Uknown error")
                        }
                    }
                }
            }
        let soccerPlayers = PFObject(className:"SoccerPlayers")
        soccerPlayers["playerName"] = "A. Wed"
        soccerPlayers["yearOfBirth"] = 1997
        soccerPlayers["emailContact"] = "a.wed@email.io"
        soccerPlayers.saveInBackground {
          (success: Bool, error: Error?) in
          if (success) {
            // The object has been saved.
          } else {
            // There was a problem, check error.description
          }
        }
        
        //let query = PFQuery(className:"SoccerPlayers")
        //query.getObjectInBackground(withId: "k7uKu7WHoE") { (object: PFObject?, error: Error?) in
          //if error == nil && soccerPlayers != nil {
            //print(soccerPlayers)
          //} else {
            //print(error)
          //}
        //}
        
        let query = PFQuery(className:"SoccerPlayers")
        query.getObjectInBackground(withId: "k7uKu7WHoE") { (player: PFObject?, error: Error?) in
          if error != nil {
            print(error)
          } else if let player = player {
            player["yearOfBirth"] = 1998
            player["emailContact"] = "a.wed@domain.io"
            player.saveInBackground()
          }
            }
        
        let query2 = PFQuery(className:"SoccerPlayers")
        query2.getObjectInBackground(withId: "c3JQpZh86W") { (player: PFObject?, error: Error?) in
            if let soccerPlayer = player {
                soccerPlayer.deleteInBackground() {(success, error) in
                    if success {
                        print("Success")
                    }
                }
            }
    }
}
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

