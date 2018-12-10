//
//  CoreDataStack.swift
//  Note
//
//  Created by Lilianna Kinakh on 12/4/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import CoreData

class CoreDataStack: NSObject {

    // MARK: Shared
    
    static let currentStack = CoreDataStack()

    // MARK: Properties
    
    lazy private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Note")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Error handling
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: Public
    
    func currentContext() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //MARK: Create Managed Object
    
    func newNote() -> Note {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: persistentContainer.viewContext) as! Note
        return note
    }
    
    func newUser() -> User {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: persistentContainer.viewContext) as! User
        return user
    }
    
    //MARK: remove Managed Object
    
    func remove(user: User) {
        persistentContainer.viewContext.delete(user)
    }
    
    func remove(note: Note) {
        persistentContainer.viewContext.delete(note)
    }
}
