//
//  CoreDataStack.swift
//  Note
//
//  Created by Lilianna Kinakh on 12/4/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import CoreData

class CoreDataStack: NSObject {
     static let moduleName = "Note"
     static let currentStack = CoreDataStack()
    
    
    //MARK: Object Model
    
    lazy var managedObjectModel: NSManagedObjectModel = {
    let modelURL = Bundle.main.url(forResource: CoreDataStack.moduleName, withExtension: "momd")!
    
    return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
      //MARK: Persistent Store Coordinator
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        let appDocumentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                             in: .userDomainMask).last!
        let persistentStoreURL = appDocumentsDirectory.appendingPathComponent("Note.sqlite")
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                               configurationName: nil,
                                               at: persistentStoreURL,
                                               options: [NSMigratePersistentStoresAutomaticallyOption: true,
                                                         NSInferMappingModelAutomaticallyOption: true])
        } catch {
            fatalError("Persistent store error! \(error)")
        }
        
        return coordinator
    }()
    
    //MARK: managed Object Context
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        moc.persistentStoreCoordinator = self.persistentStoreCoordinator
        return moc
    }()
    
    //MARK: save Context
    
    func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                fatalError("Saving context error! \(error)")
            }
        }
    }

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Note")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Error handling
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - core Data Saving support
    
    func saveContextViaContainer () {
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
    
    //MARK: new Managed Object
    
    func newNote() -> Note {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedObjectContext) as! Note
        return note
    }
    
    func newUser() -> User {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: managedObjectContext) as! User
        return user
    }
    
    //MARK: remove Managed Object
    
    func remove(user: User) {
        managedObjectContext.delete(user)
    }
    
    func remove(note: Note) {
        managedObjectContext.delete(note)
    }
    
}
