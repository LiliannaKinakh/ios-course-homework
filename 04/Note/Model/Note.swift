
import UIKit
import Foundation

protocol TagProtocol: class {
    var note: NoteProtocol { get set }
}

protocol NoteProtocol: class {
    
}

class Tag: TagProtocol {
    
    var note: NoteProtocol
    let data: Date = Date()
    var tagText: String
    
    init(tagText: String, note: NoteProtocol) {
        
        self.tagText = tagText
        self.note = note
    }
}

class Note: NoteProtocol {
    
    var title: String
    var text: String
    
    var tags = [TagProtocol]()
    
    init(title:String, text:String) {
        self.title = title
        self.text = text
    }
    func add(_ tag : TagProtocol) {
        tags.append(tag)
    }
}



