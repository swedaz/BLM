//
//  InterestsViewController.swift
//  BlackLivesMatter
//
//  Created by Swetha Mohandas on 7/8/20.
//  Copyright © 2020 Sambar. All rights reserved.
//

import Foundation
import UIKit
import Parse

class InterestsViewController: UIViewController {
    
    @IBOutlet weak var Interest1: UIButton!
    @IBOutlet weak var Interest2: UIButton!
    @IBOutlet weak var Interest3: UIButton!
    @IBOutlet weak var Interest4: UIButton!
    @IBOutlet weak var Interest5: UIButton!
    @IBOutlet weak var Interest6: UIButton!
    @IBOutlet weak var Done: UIButton!
    
    var interests = [String]()
    var currentUser = PFUser()
    var count1 = 0
    var count2 = 0
    var count3 = 0
    var count4 = 0
    var count5 = 0
    var count6 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = PFUser.current() {
            currentUser = user
        }
        self.Interest1!.backgroundColor = .gray
        self.Interest2!.backgroundColor = .gray
        self.Interest3!.backgroundColor = .gray
        self.Interest4!.backgroundColor = .gray
        self.Interest5!.backgroundColor = .gray
        self.Interest6!.backgroundColor = .gray
    }
    
    @IBAction func Interest1Action(_ sender: Any) {
        count1 += 1
        if ((count1 % 2) == 1) {
            interests.append("interest 1")
            self.Interest1!.backgroundColor = .blue
        }
        else {
            interests.removeAll{$0 == "interest 1"}
            self.Interest1!.backgroundColor = .gray
        }
    }
    
    @IBAction func Interest2Action(_ sender: Any) {
        count2 += 1
        if ((count2 % 2) == 1) {
            interests.append("interest 2")
            self.Interest2!.backgroundColor = .blue
        }
        else {
            interests.removeAll{$0 == "interest 2"}
            self.Interest2!.backgroundColor = .gray
        }
    }
    
    @IBAction func Interest3Action(_ sender: Any) {
        count3 += 1
        if ((count3 % 2) == 1) {
            interests.append("interest 3")
            self.Interest3!.backgroundColor = .blue
        }
        else {
            interests.removeAll{$0 == "interest 3"}
            self.Interest3!.backgroundColor = .gray
        }
    }
    
    @IBAction func Interest4Action(_ sender: Any) {
        count4 += 1
        if ((count4 % 2) == 1) {
            interests.append("interest 4")
            self.Interest4!.backgroundColor = .blue
        }
        else {
            interests.removeAll{$0 == "interest 4"}
            self.Interest4!.backgroundColor = .gray
        }
    }
    
    @IBAction func Interest5Action(_ sender: Any) {
        count5 += 1
        if ((count5 % 2) == 1) {
            interests.append("interest 5")
            self.Interest5!.backgroundColor = .blue
        }
        else {
            interests.removeAll{$0 == "interest 5"}
            self.Interest5!.backgroundColor = .gray
        }
    }
    
    @IBAction func Interest6Action(_ sender: Any) {
        count6 += 1
        if ((count6 % 2) == 1) {
            interests.append("interest 6")
            self.Interest6!.backgroundColor = .blue
        }
        else {
            interests.removeAll{$0 == "interest 6"}
            self.Interest6!.backgroundColor = .gray
        }
    }
    
    
    @IBAction func DoneAction(_ sender: Any) {
        print(interests)
        updateSurvey()
        loadHome()
    }
    
    func updateSurvey() {
           if let currentUser = PFUser.current() {
               currentUser["interests"] = interests
               currentUser.saveInBackground { (success, error) in
                   if error == nil {
                       print("Success: User interests responses")
                   }
               }
           }
        }
    
    func loadHome(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homepageVC = storyBoard.instantiateViewController(withIdentifier: "homepage") as! HomepageViewController
        self.present(homepageVC, animated: true, completion: nil)
    }
    
}
