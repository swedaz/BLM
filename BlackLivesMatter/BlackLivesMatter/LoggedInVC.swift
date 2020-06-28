//
//  LoggedInVC.swift
//  BlackLivesMatter
//
//  Created by Swetha Mohandas on 6/24/20.
//  Copyright © 2020 Sambar. All rights reserved.
//

import Foundation
import UIKit
import Parse

class LoggedInVC: UIViewController {
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    
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
    
    func loadHome(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homepageVC = storyBoard.instantiateViewController(withIdentifier: "homepage") as! HomepageViewController
        self.present(homepageVC, animated: true, completion: nil)
    }
    
    @IBAction func signIn(_ sender: Any) {
        let sv = UIViewController.displaySpinner(onView: self.view)
        PFUser.logInWithUsername(inBackground: username.text!, password: password.text!) { (user, error) in
            UIViewController.removeSpinner(spinner: sv)
            if user != nil {
                self.loadHome()
            }else{
                if let descrip = error?.localizedDescription{
                    self.displayErrorMessage(message: (descrip))
                }
            } 
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        let user = PFUser()
        user.username = username.text
        user.password = password.text
        let sv = UIViewController.displaySpinner(onView: self.view)
        user.signUpInBackground { (success, error) in
            UIViewController.removeSpinner(spinner: sv)
            if success{
                self.loadSurvey()
            }else{
                if let descrip = error?.localizedDescription{
                    self.displayErrorMessage(message: descrip)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.text = ""
        username.text = ""
    }
    
    func loadSurvey(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let surveyVC = storyBoard.instantiateViewController(withIdentifier: "SurveyIntro") as! ViewController
        self.present(surveyVC, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let currentUser = PFUser.current()
        if currentUser != nil {
            loadSurvey()
    }
        


}

}
