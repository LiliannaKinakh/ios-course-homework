
import UIKit
import Foundation

protocol NoteDelegate {
    var allNotes: [Notes] { get set }
    
    func saveNote(note:Notes)
    func editNote(note:Notes, indexOfElement:Int)
    
}

class Notes {
    
    var title: String
    var text: String
    var image: UIImage?
    
    init(title:String, text:String) {
        self.title = title
        self.text = text
        
    }
    
}



