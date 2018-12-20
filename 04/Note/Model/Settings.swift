//
//  Settings.swift
//  Note
//
//  Created by Lilianna Kinakh on 12/20/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import Foundation

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
