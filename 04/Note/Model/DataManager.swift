//
//  DataManager.swift
//  Note
//
//  Created by Lilianna Kinakh on 12/13/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import Foundation
import CoreData


typealias NotesCallback = ([Note]?) -> ()

class DataManager {
    
    static let shared = DataManager()
    
    func getNotesObj(with callback:@escaping NotesCallback) {
        DispatchQueue.global(qos: .default).async {
            let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
            var notes: [Note]?
            
            do {
                notes = try CoreDataStack.context.fetch(fetchRequest)
            }
            catch {
                //TODO:
            }
            
            DispatchQueue.main.async {
                callback(notes)
            }
        }
    }
    
    func addNote(title:String, text:String)  {
        DispatchQueue.global(qos: .utility).async {
            print(Thread.current)
            let note = Note(context: CoreDataStack.context)
            note.text = text
            note.title = title
            CoreDataStack.saveContext()
        }
    }
    
    func deletedNote(note:Note) {
         CoreDataStack.context.delete(note)
    }
}
