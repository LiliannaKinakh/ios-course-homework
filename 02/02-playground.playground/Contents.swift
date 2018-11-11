import UIKit
import Foundation

//1. Написати екстеншин до класу Array який би додавав метод видалення по переданому елементу, а не індексу. Екстеншин повинен працювати лише для класів, які перегрузили протокол Equotable для порівняння;

// 2. Добавити метод до того ж Array, котрий би безпечно діставав елемент за індексом та видаляв за індексом без крешу, якщо такого індексу не існує.

class Diary: Equatable {
    
    var name: String
    var text: String
    var age : Int
    
    init(name: String, age: Int, text: String) {
        self.name = name
        self.age = age
        self.text = text
    }
    
    static func == (lhs: Diary, rhs: Diary) -> Bool {
        return lhs.age == rhs.age && lhs.name == rhs.name && lhs.text == rhs.text
    }
}

extension Array where Element: Equatable {
    
    mutating func removeElement(element: Element) {
        if let index = index(of: element) {
            remove(at: index)
        }
    }
    
    mutating func removeElementAtIndex(index: Int) {
        if (index >= 0) && (index < self.count) {
            remove(at: index)
        } else {
            if self.isEmpty {
                print("This array is Empty !")
            } else {
                print("This array has indexes in the range from 0 to \(self.count-1),try another index !")
            }
        }
    }
}

var arrayOfMyClasses: [Diary] = [Diary]()

let firstEntry = Diary(name: "One", age: 18, text: "Hello-1")
let first1Entry = Diary(name: "One", age: 18, text: "Hello-1")
let secondEntry = Diary(name: "Two", age: 19, text: "Hello-2")
let thirdEntry = Diary(name: "Three", age: 20, text: "Hello-3")
let fourEntry = Diary(name: "Four", age: 21, text: "Hello-4")
let fifthEntry = Diary(name: "Five", age: 21, text: "Hello-5")

// Test 1

firstEntry == secondEntry
firstEntry == first1Entry

arrayOfMyClasses.append(firstEntry)
arrayOfMyClasses.append(secondEntry)
arrayOfMyClasses.append(thirdEntry)
arrayOfMyClasses.append(fourEntry)
arrayOfMyClasses.append(fifthEntry)
arrayOfMyClasses.append(secondEntry)
arrayOfMyClasses.append(thirdEntry)
arrayOfMyClasses.append(fourEntry)

arrayOfMyClasses.count

arrayOfMyClasses.removeElement(element: firstEntry)
arrayOfMyClasses.removeElement(element: secondEntry)
arrayOfMyClasses.removeElement(element: thirdEntry)
arrayOfMyClasses.removeElement(element: fifthEntry)

arrayOfMyClasses.count

// Test 2

arrayOfMyClasses.count

arrayOfMyClasses.removeElementAtIndex(index: 4)
arrayOfMyClasses.removeElementAtIndex(index: -1)
arrayOfMyClasses.removeElementAtIndex(index: 8)
arrayOfMyClasses.removeElementAtIndex(index: 100)

arrayOfMyClasses.count

arrayOfMyClasses.removeElementAtIndex(index: 3)
arrayOfMyClasses.removeElementAtIndex(index: 2)
arrayOfMyClasses.removeElementAtIndex(index: 0)
arrayOfMyClasses.removeElementAtIndex(index: 0)

arrayOfMyClasses.count

arrayOfMyClasses.removeElementAtIndex(index: 0)
