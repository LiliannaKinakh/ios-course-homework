//
//  SettingsViewController.swift
//  Note
//
//  Created by Lilianna Kinakh on 11/30/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    class Settings {
        
    }
    
    @IBOutlet weak var labelSettings: UILabel!
    @IBOutlet weak var switchViewController: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeMode(_ sender: Any) {
        if switchViewController.isOn == true {
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.barStyle = UIBarStyle.black //user global variable
            self.navigationController?.navigationBar.tintColor = UIColor.black //user global variable
            UIApplication.shared.statusBarStyle = .lightContent
            self.tabBarController?.tabBar.barTintColor = UIColor.black
            view.backgroundColor = UIColor.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
            labelSettings.textColor = .white
            
        }
        else {
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.barStyle = UIBarStyle.default //user global variable
            self.navigationController?.navigationBar.tintColor = UIColor.white //user global variable
            UIApplication.shared.statusBarStyle = .default
            self.tabBarController?.tabBar.barTintColor = UIColor.white
            view.backgroundColor = UIColor.groupTableViewBackground
        }
    }
}
