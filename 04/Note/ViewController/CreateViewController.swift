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
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default , handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            } else {
                print("Camera not Available")
            }
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default , handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: nil))
    
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
  //  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
          picker.dismiss(animated: true, completion: nil)
    }
    
}
