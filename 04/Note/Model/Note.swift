
import UIKit
import Foundation

protocol NoteDelegate {
    var allNotes: [Note] { get set }
    
    func saveNote(note:Note)
    func editNote(note:Note, indexOfElement:Int)
    
}

class Note {
    
    var title: String
    var text: String
    var image: UIImage?
    
    init(title:String, text:String) {
        self.title = title
        self.text = text
        
    }
    
}



