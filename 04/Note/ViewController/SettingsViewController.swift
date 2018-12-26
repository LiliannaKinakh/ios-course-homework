//
//  SettingsViewController.swift
//  Note
//
//  Created by Lilianna Kinakh on 11/30/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var labelSettings: UILabel!
    @IBOutlet weak var switchViewController: UISwitch!
    @IBOutlet weak var viewCells: UISwitch!
    @IBOutlet weak var labelViewCell: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: FIXME
        switchViewController.setOn(Settings.shared.isDarkModeOn , animated: true)
        switchToDarkMode()
    }

    @IBAction func changeMode(_ sender: Any) {
        switchViewController.addTarget(self, action: #selector(switchToDarkMode), for: .allTouchEvents)
        Settings.shared.isDarkModeOn = switchViewController.isOn
    }
    
    @IBAction func changeMethodShowCell(_ sender: Any) {
         Settings.shared.shouldShowTableView = viewCells.isOn
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Settings.shared.applyChanges()
    }
    
    @objc func switchToDarkMode() {
        if Settings.shared.isDarkModeOn {
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.barStyle = UIBarStyle.black //user global variable
            self.navigationController?.navigationBar.tintColor = UIColor.black //user global variable
            self.tabBarController?.tabBar.barTintColor = UIColor.black
            view.backgroundColor = .black
            labelSettings.textColor = .white
            labelViewCell.textColor = .white
        } else {
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.barStyle = UIBarStyle.default //user global variable
            self.navigationController?.navigationBar.tintColor = UIColor.white //user global variable
            self.tabBarController?.tabBar.barTintColor = UIColor.white
            view.backgroundColor = .white
            labelSettings.textColor = .black
            labelViewCell.textColor = .black
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        switchToDarkMode()
        switchViewController.setOn(Settings.shared.isDarkModeOn, animated: true)
        viewCells.setOn(Settings.shared.shouldShowTableView, animated: true)
    }
}
