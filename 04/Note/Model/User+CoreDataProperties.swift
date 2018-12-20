//
//  User+CoreDataProperties.swift
//  Note
//
//  Created by Lilianna Kinakh on 12/20/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var age: Int16
    @NSManaged public var lastName: String?
    @NSManaged public var gender: Bool
    @NSManaged public var note: NSSet?

}

// MARK: Generated accessors for note
extension User {

    @objc(addNoteObject:)
    @NSManaged public func addToNote(_ value: Note)

    @objc(removeNoteObject:)
    @NSManaged public func removeFromNote(_ value: Note)

    @objc(addNote:)
    @NSManaged public func addToNote(_ values: NSSet)

    @objc(removeNote:)
    @NSManaged public func removeFromNote(_ values: NSSet)

}
