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
    let questions = ["Are you 18+?", "Are you registered to vote?", "Have you voted before?", "Do you know who the mayor of Atlanta is?"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Questions()
    }
    
    @IBAction func YesButtonAction(_ sender: Any) {
        if (questionNum != questions.count) {
            questionNum += 1
            if (questionNum == 4) {
                loadHome()
            }
            else{
               Questions()
            }
        }
        if (questionNum == 4) {
            loadHome()
        }
    }
    
    @IBAction func NoButtonAction(_ sender: Any) {
        if (questionNum == 0) {
            Over18 = false
        }
        if (questionNum == 1) {
            registered = false
        }
        if (questionNum == 2) {
            voted = false
        }
        if (questionNum == 3) {
            knowMayor = false
        }
        if (questionNum != questions.count) {
            questionNum += 1
            if (questionNum == 4) {
                loadHome()
            }
            else{
               Questions()
            }
        }

    }
    
    func Questions() {
        label.text = questions[questionNum]
    }
    
    func loadHome(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homepageVC = storyBoard.instantiateViewController(withIdentifier: "homepage") as! HomepageViewController
        self.present(homepageVC, animated: true, completion: nil)
    }
}
