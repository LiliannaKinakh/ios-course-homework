//
//  EditViewController.swift
//  Note
//
//  Created by Lilianna Kinakh on 11/28/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    var thisNote = Note()

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var updateButton: UIButton!
    
    override func viewDidLoad() {
        
        titleLabel.text = "Title"
        textLabel.text = "Text"
        attributeToSaveButton()
        
        titleTextField.text = thisNote.title
        textTextField.text =  thisNote.text
        
        super.viewDidLoad()
        self.hideKeyboard()
        
    }
    
    func attributeToSaveButton() {
        updateButton.layer.borderWidth = 1
        updateButton.layer.borderColor = UIColor.blue.cgColor
        updateButton.layer.cornerRadius = updateButton.bounds.height / 2.5
        
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        thisNote.text = textTextField.text ?? ""
        thisNote.title = titleTextField.text ?? ""

        CoreDataStack.saveContext()

        navigationController?.popViewController(animated: true)
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if Settings.shared.isDarkModeOn {
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.barStyle = UIBarStyle.black //user global variable
            self.navigationController?.navigationBar.tintColor = UIColor.white  //user global variable
            self.tabBarController?.tabBar.barTintColor = UIColor.black
            view.backgroundColor = .black
            titleLabel.textColor = .white
            textLabel.textColor = .white
            titleTextField.backgroundColor = .white
            textTextField.backgroundColor = .white
            updateButton.backgroundColor = .white
            updateButton.titleLabel?.textColor = .black
            imageView.backgroundColor = .white
        } else {
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.barStyle = UIBarStyle.default //user global variable
            self.navigationController?.navigationBar.tintColor = UIColor.black //user global variable
            self.tabBarController?.tabBar.barTintColor = UIColor.white
            view.backgroundColor = .white
            titleLabel.textColor = .black
            textLabel.textColor = .black
            titleTextField.backgroundColor = .white
            textTextField.backgroundColor = .white
        }
    }
    
}
