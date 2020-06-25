//
//  HomepageViewController.swift
//  BlackLivesMatter
//
//  Created by Swetha Mohandas on 6/12/20.
//  Copyright © 2020 Sambar. All rights reserved.
//

import Foundation
import UIKit
import Parse

class HomepageViewController: UIViewController {
    
    func displayErrorMessage(message:String) {
        let alertView = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
        }
        alertView.addAction(OKAction)
        if let presenter = alertView.popoverPresentationController {
            presenter.sourceView = self.view
            presenter.sourceRect = self.view.bounds
        }
        self.present(alertView, animated: true, completion:nil)
    }
    
    @IBAction func logOut(_ sender: Any) {
        let sv = UIViewController.displaySpinner(onView: self.view)
        PFUser.logOutInBackground { (error: Error?) in
            UIViewController.removeSpinner(spinner: sv)
            if (error == nil){
                self.loadLoginScreen()
            }else{
                if let descrip = error?.localizedDescription{
                    self.displayErrorMessage(message: descrip)
                }else{
                    self.displayErrorMessage(message: "error logging out")
                }

            }
        }
    }
    
    func loadLoginScreen(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let logInviewController = storyBoard.instantiateViewController(withIdentifier: "LoggedInViewController") as! LoggedInVC
        self.present(logInviewController, animated: true, completion: nil)
    }
}
