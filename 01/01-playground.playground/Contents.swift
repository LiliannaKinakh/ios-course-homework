import UIKit
import Foundation

class Diary {
    
    let createDate: Date
    
    var name: String? {
        didSet {
            if let checkedName = name {
                if checkedName.isEmpty {
                     print("⚠⚠⚠ Mr.developer ⚠⚠⚠ The 'Name' has been changed!!!New name value is - Empty ⚠⚠⚠")
                } else {
                    print("⚠⚠⚠ Mr.developer ⚠⚠⚠ The 'Name' has been changed!!!New name value is - \(checkedName) ⚠⚠⚠")
                }
            } else {
                print("⚠⚠⚠ Mr.developer ⚠⚠⚠  The 'Text' has been changed!!! New text value is - NIL ⚠⚠⚠")
            }
        }
    }
    
    var text: String? {
        willSet(text) {
            if let checkedText = text {
                if checkedText.isEmpty {
                    print("⚠⚠⚠ Mr.developer ⚠⚠⚠  The 'Text' has been changed!!!New name value is - Empty ⚠⚠⚠")
                } else {
                    print("⚠⚠⚠ Mr.developer ⚠⚠⚠  The 'Text' has been changed!!! New text value is - \(checkedText) ⚠⚠⚠")
                }
            } else {
                print("⚠⚠⚠ Mr.developer ⚠⚠⚠ The 'Text' has been changed!!! New text value is - NIL ⚠⚠⚠")
            }
        }
    }
    
    var tag = [String]() {
        didSet {
            if tag.isEmpty {
               print("⚠⚠⚠Mr.developer ⚠⚠⚠ The 'TAGS' are Empty ⚠⚠⚠")
            } else {
                print("Mr.developer ⚠⚠⚠  The 'TAG' has been changed!!!New teg(s) value - \(tag) ⚠⚠⚠")
            }
        }
    }
    
    init() {
        self.createDate = Date()
    }
    
    convenience init(name: String, text: String){
        self.init()
        self.name = name
        self.text = text
    }
    
    convenience init(name: String, text: String, tag:[String]){
        self.init()
        self.name = name
        self.text = text
        self.tag = tag
        
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    
    convenience init(text: String) {
        self.init()
        self.text = text
    }
    
    convenience init(tag:[String]){
        self.init()
        self.tag = tag
    }
    
    
    convenience init?(date:Date?) {
        guard let checkedDate = date else {
            print("Date is not existing!")
            return nil
        }
        
        let currentDate = Date()
        if checkedDate.compare(currentDate) == .orderedAscending {
            print("Given date is older than needed!")
            return nil
        }
        
        self.init()
    }
    
    func description() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let createDate = dateFormatter.string(from:self.createDate)
        
        let diaryName = name ?? ""
        let diaryText = text ?? ""
        
        var tags = ""
        
        if tag.isEmpty{
            tags = ""
        } else {
            for i in tag {
                tags += ("[\(i)]")
            }
            
        }
     
        var secondRow = "\(diaryName)\(tags)"
        if secondRow.isEmpty {
            secondRow = ""
        } else {
            secondRow += "\n"
        }
        
        let result = "\(createDate)\n\(secondRow)\(diaryText)"
        
        return result
    }
    
}

//_____________Test____________________
//Створити в Playground декілька об’єктів цього класу, з різними даними та ініціалізаторами,один
//з них має бути повністю пустий (лише дата), один з непустими всіма властивостями, плюс ще якісь.
//Упевнитися, що description() в усіх цих випадках видає такий результат, як ви задумали.
//Упевнитись що функціональність інформування про зміну стану обєкту працює правильно.


var firstEntry = Diary()
print(firstEntry.description())

var secondEntry = Diary(name:"Good day", text: "I meet my friend", tag: ["meeting","nice"])
print(secondEntry.description())

var thirdEntry = Diary(text: "I ate delicious ice cream")
thirdEntry.name = "Ummi !!!"
thirdEntry.text = ""
thirdEntry.text = nil
thirdEntry.name = "Ummi-ummi!!!"
print(thirdEntry.description())

var fourthEntry = Diary(name: "My homework")
fourthEntry.name = nil
fourthEntry.tag = []
print(fourthEntry.description())
