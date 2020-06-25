//
//  Extensions.swift
//  BlackLivesMatter
//
//  Created by Swetha Mohandas on 6/24/20.
//  Copyright © 2020 Sambar. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
 class func displaySpinner(onView : UIView) -> UIView {
     let spinnerView = UIView.init(frame: onView.bounds)
     spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
     let ai = UIActivityIndicatorView.init(style: .whiteLarge)
     ai.startAnimating()
     ai.center = spinnerView.center

     DispatchQueue.main.async {
         spinnerView.addSubview(ai)
         onView.addSubview(spinnerView)
     }

     return spinnerView
 }

 class func removeSpinner(spinner :UIView) {
     DispatchQueue.main.async {
         spinner.removeFromSuperview()
     }
 }
}
