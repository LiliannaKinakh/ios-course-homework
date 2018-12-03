//
//  CreateViewController.swift
//  Note
//
//  Created by Vladyslav Zhulavskyi on 11/15/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
      var imagepicker = UIImagePickerController()
    
    
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
        let image = imageView.image
        
        let note = Note(title: title, text: text)
        note.image = image
        
        delegate?.saveNote(note: note)
        
        
        navigationController?.popViewController(animated: true)
   
    }
    @IBAction func downloadImageTapped(_ sender: Any) {
        imagepicker.delegate = self
        imagepicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        self.present(imagepicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
}
