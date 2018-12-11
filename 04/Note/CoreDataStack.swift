//
//  CoreDataStack.swift
//  Note
//
//  Created by Lilianna Kinakh on 12/4/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import CoreData

class CoreDataStack {

    // MARK: Shared
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static let currentStack = CoreDataStack()

    // MARK: Properties
    
    static private var persistentContainer: NSPersistentContainer = {
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
    
   static func currentContext() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static func saveContext () {
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
    
}
