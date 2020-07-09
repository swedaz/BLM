//
//  SurveyViewController.swift
//  BlackLivesMatter
//
//  Created by Swetha Mohandas on 6/12/20.
//  Copyright © 2020 Sambar. All rights reserved.
//

import Foundation
import UIKit
import Parse

class SurveyViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var YesButton: UIButton!
    @IBOutlet weak var NoButton: UIButton!
    @IBOutlet weak var ProgressTracker: UIPageControl!
    
    var questionNum = 0
    var Over18 = true
    var registered = true
    var voted = true
    var knowMayor = true
    var currentUser = PFUser()
    let questions = ["Do you know who the mayor of Atlanta is?","Are you 18+?", "Are you registered to vote?", "Have you voted before?"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = PFUser.current() {
            currentUser = user
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Questions()
    }
    
    @IBAction func YesButtonAction(_ sender: Any) {
        if (questionNum != questions.count) {
            questionNum += 1
            if (questionNum == 4) {
                loadInterests()
                updateSurvey()
            }
            else{
               Questions()
            }
        }
        if (questionNum == 4) {
            loadInterests()
            updateSurvey()
        }
    }
    
    @IBAction func NoButtonAction(_ sender: Any) {
        if (questionNum == 0) {
            knowMayor = false
            print(knowMayor)
        }
        if (questionNum == 1) {
            Over18 = false
            loadInterests()
            updateSurvey()
        }
        if (questionNum == 2) {
            registered = false
        }
        if (questionNum == 3) {
            voted = false
        }
        if (questionNum != questions.count) {
            questionNum += 1
            if (questionNum == 4) {
                loadInterests()
                updateSurvey()
            }
            else{
               Questions()
            }
        }

    }
    
    func Questions() {
        label.text = questions[questionNum]
    }
    
    func updateSurvey() {
        if let currentUser = PFUser.current() {
            currentUser["Over18"] = Over18
            currentUser["registered"] = registered
            currentUser["voted"] = voted
            currentUser["knowMayor"] = knowMayor
            currentUser.saveInBackground { (success, error) in
                if error == nil {
                    print("Success: Update user survey responses")
                }
            }
        }
    }
    
    func loadInterests(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homepageVC = storyBoard.instantiateViewController(withIdentifier: "Interests") as! InterestsViewController
        self.present(homepageVC, animated: true, completion: nil)
    }
}
