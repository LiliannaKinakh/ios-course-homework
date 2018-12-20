//
//  UIViewController+keyboard.swift
//  Note
//
//  Created by Lilianna Kinakh on 12/20/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

