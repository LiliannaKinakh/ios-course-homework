//
//  EditViewController.swift
//  Note
//
//  Created by Lilianna Kinakh on 11/28/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    var thisNote = Notes(title: "", text: "")
    var pathIndex:Int = 0
    var delegate: NoteDelegate?
    
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
        
        titleTextField.text = "\(String(describing: thisNote.title))"
        textTextField.text = "\(String(describing: thisNote.text))"
        imageView.image = thisNote.image
        
        
        super.viewDidLoad()
        self.hideKeyboard()
    }
    
    func attributeToSaveButton() {
        updateButton.layer.borderWidth = 1
        updateButton.layer.borderColor = UIColor.blue.cgColor
        updateButton.layer.cornerRadius = updateButton.bounds.height / 2.5
        
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let text = textTextField.text ?? ""
        let title = titleTextField.text ?? ""
       
        
        let editNote = Notes(title: title , text: text)
        editNote.image =  thisNote.image
        
        delegate?.editNote(note: editNote, indexOfElement: pathIndex)
        
        navigationController?.popViewController(animated: true)
      
    }
    
}
