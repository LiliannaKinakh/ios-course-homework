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
    
    var title: String {
        didSet {
            let date = Date()
            if title.isEmpty {
                print("New title value is 'Empty', and old title value is '\(oldValue)'.Item was edited in \(date)!")
            } else {
                print("New title value is '\(title)', and old title value is '\(oldValue)'.Item was edited in \(date)!")
            }
        }
    }
    
    var text: String {
        didSet {
            let date = Date()
            if text.isEmpty {
                print("New text value is 'Empty', and old text value is '\(oldValue)'.Item was edited in \(date) !")
            } else {
                print("New text value is '\(text)', and old text value is '\(oldValue)'.Item was edited in \(date) !")
            }
        }
    }
    
    var tags = [TagProtocol]()
    
    init(title:String, text:String) {
        
        self.title = title
        self.text = text
    }
    
    func add(_ tag : TagProtocol) {
        tags.append(tag)
    }
}


var objNote = Note(title: "First Test Title", text: "Test text 1 ")
var objNote2 = Note(title: "Second Test Title", text: "Test text 2")

objNote2.text = "Some text"
objNote2.title = "Some title"
objNote2.title = ""

var objTag = Tag(tagText: "Tag_111", note: objNote)

objTag.tagText = "Edit Text"

var objTag2 = Tag(tagText: "Tag_222", note: objNote2)

