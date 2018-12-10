//
//  LoginViewController.swift
//  Note
//
//  Created by Lilianna Kinakh on 12/4/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit
import KeychainAccess

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        
    let email = emailTextField.text ?? "1"
    let password = passwordTextField.text ?? "2"

    let keychain = Keychain(service: "com.note.project.ios.lits")
    
    try? keychain.set(email, key: "keyEmail")
    try? keychain.set(password, key: "keyPassword")
        
    }
}
