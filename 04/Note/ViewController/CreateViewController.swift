//
//  CreateViewController.swift
//  Note
//
//  Created by Vladyslav Zhulavskyi on 11/15/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var delegate: NoteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Title"
        textLabel.text = "Text"
        attributeToSaveButton()
        
    }
    func attributeToSaveButton() {
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.blue.cgColor
        saveButton.layer.cornerRadius = saveButton.bounds.height / 2.5
        
    }
    //MARK: -Save button
    @IBAction func SaveButton(_ sender: Any) {
        let title = titleTextField.text ?? ""
        let text = textTextField.text ?? ""
        
        let note = Note(title: title, text: text)
        
        delegate?.saveNote(note: note)
   
    }
    
}
