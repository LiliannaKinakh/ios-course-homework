//
//  SettingsViewController.swift
//  Note
//
//  Created by Lilianna Kinakh on 11/30/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class Settings {
    
    static let shared = Settings()
    
    var isDarkModeOn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "darkMode")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "darkMode")
        }
    }
    
    var shouldShowTableView: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "typeOfDisplayCell")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "typeOfDisplayCell")        }
    }
    
    func applyChanges() {
        UserDefaults.standard.synchronize()
    }

}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var labelSettings: UILabel!
    @IBOutlet weak var switchViewController: UISwitch!
    @IBOutlet weak var viewCells: UISwitch!
    @IBOutlet weak var labelViewCell: UILabel!
    
    let setting = Settings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchToDarkMode()
        setting.shouldShowTableView = switchViewController.isOn 
        viewCells.isOn = UserDefaults.standard.bool(forKey: "typeOfDisplayCell")
    }

    @IBAction func changeMode(_ sender: Any) {
        switchToDarkMode()
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        Settings.shared.applyChanges()
    }
    

    static func sharedDarkMode() -> Bool {
        let check = UserDefaults.standard.bool(forKey: "darkMode")
        return check
    }
    func switchToDarkMode() {
        if Settings.shared.isDarkModeOn == false {
            
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.barStyle = UIBarStyle.black //user global variable
            self.navigationController?.navigationBar.tintColor = UIColor.black //user global variable
            UIApplication.shared.statusBarStyle = .lightContent
            self.tabBarController?.tabBar.barTintColor = UIColor.black
            view.backgroundColor = .black
            labelSettings.textColor = .white
            labelViewCell.textColor = .white
            
        } else {
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.barStyle = UIBarStyle.default //user global variable
            self.navigationController?.navigationBar.tintColor = UIColor.white //user global variable
            self.tabBarController?.tabBar.barTintColor = UIColor.black
            view.backgroundColor = .white
            labelSettings.textColor = .black
            labelViewCell.textColor = .black
        }
    }
}
