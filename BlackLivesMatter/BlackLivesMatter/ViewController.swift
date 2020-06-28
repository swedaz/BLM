//
//  ViewController.swift
//  BlackLivesMatter
//
//  Created by Swetha Mohandas on 6/10/20.
//  Copyright © 2020 Sambar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startApp() {
        let vc = storyboard?.instantiateViewController(identifier: "Survey") as! SurveyViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

