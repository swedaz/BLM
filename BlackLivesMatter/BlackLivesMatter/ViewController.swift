//
//  ViewController.swift
//  BlackLivesMatter
//
//  Created by Swetha Mohandas on 6/10/20.
//  Copyright © 2020 Sambar. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    
    @IBOutlet weak var startButton: UIButton!
    var currentUser = PFUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = PFUser.current() {
            currentUser = user
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startApp(_ sender: Any) {
        if currentUser["interests"] == nil {
            let vc = storyboard?.instantiateViewController(identifier: "Survey") as! SurveyViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let homepageVC = storyBoard.instantiateViewController(withIdentifier: "homepage") as! HomepageViewController
            self.present(homepageVC, animated: true, completion: nil)
        }
    }
}

