//
//  SettingsViewController.swift
//  Note
//
//  Created by Lilianna Kinakh on 11/30/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class Settings {
    
    var saveSetting = { (darkMode: Bool, typeOfDisplayCell: Bool) in
        
        UserDefaults.standard.set(darkMode, forKey: "darkMode")
        UserDefaults.standard.set(typeOfDisplayCell, forKey: "typeOfDisplayCell")
        
    }
    
    var getDarkMood = {
        return UserDefaults.standard.bool(forKey: "darkMode")
    }
    var getTypeOfDisplayCell = {
        return UserDefaults.standard.bool(forKey: "typeOfDisplayCell")
    }
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var labelSettings: UILabel!
    @IBOutlet weak var switchViewController: UISwitch!
    @IBOutlet weak var viewCells: UISwitch!
    
    let setting = Settings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchButton()
        switchViewController.isOn = UserDefaults.standard.bool(forKey: "darkMood")
        viewCells.isOn = UserDefaults.standard.bool(forKey: "viewCell")
    }

    @IBAction func changeMode(_ sender: Any) {
        switchButton()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        setting.saveSetting(switchViewController.isOn, viewCells.isOn)
    }
    
    func switchButton() {
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
            self.tabBarController?.tabBar.barTintColor = UIColor.white
            view.backgroundColor = UIColor.groupTableViewBackground
        }
    }
}
