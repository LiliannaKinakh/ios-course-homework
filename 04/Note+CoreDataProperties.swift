//
//  Note+CoreDataProperties.swift
//  Note
//
//  Created by Lilianna Kinakh on 12/4/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var id: String?
    @NSManaged public var text: String?
    @NSManaged public var title: String?
    @NSManaged public var user: User?

}
