//
//  SettingsViewController.swift
//  Note
//
//  Created by Lilianna Kinakh on 11/30/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class Settings {
    var darkMood: Bool
    var viewCell: Bool
    
    init (darkMood: Bool, viewCell: Bool) {
        self.darkMood = darkMood
        self.viewCell = viewCell
    }
    
    var saveSetting = { (darkMood: Bool, viewCell: Bool) in
        UserDefaults.standard.set(darkMood, forKey: "darkMood")
        UserDefaults.standard.set(viewCell, forKey: "viewCell")
    }
    
    var getDarkMood = {
        return UserDefaults.standard.bool(forKey: "darkMood")
    }
    var getviewCell = {
        return UserDefaults.standard.bool(forKey: "viewCell")
    }
}


class SettingsViewController: UIViewController {

  
    
    @IBOutlet weak var labelSettings: UILabel!
    
    @IBOutlet weak var switchViewController: UISwitch!
    
    @IBOutlet weak var viewCells: UISwitch!
    
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
    @IBAction func saveButtonTapped(_ sender: Any) {
//        UserDefaults.standard.set(switchViewController.isOn, forKey: "switchVC")
//        UserDefaults.standard.set(viewCellSegment.selectedSegmentIndex, forKey: "segment")
//        print("Save")
        var setting = Settings(darkMood:switchViewController.isOn, viewCell: viewCells.isOn)
        setting.saveSetting(switchViewController.isOn, viewCells.isOn)
        
        print(setting)
        print(setting.darkMood)
        print(setting.getDarkMood)
        print(setting.viewCell)
        
        
        
        
        
    }
}
