//
//  ViewController.swift
//  Note
//
//  Created by Vladyslav Zhulavskyi on 11/15/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    var allNotes: [Note] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var setting = Settings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupCollectionView()
    }
    
    @IBAction func edit(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    
    func saveNote(note: Note) {
        allNotes.append(note)
        tableView.reloadData()
    }
    
    func editNote(note:Note, indexOfElement:Int) {
        allNotes[indexOfElement] = note
        
    }
    
    //MARK: - Delegate

    private func setupTableView() {
        tableView.register(UINib(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    private func setupCollectionView(){
        collectionView.register(UINib(nibName: "NoteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.itemSize = CGSize(width: 200 , height: 100)
        
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.size.height / 8
        
    }
    //MARK: - Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NoteTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setupWith(note: allNotes[indexPath.row])
        
        return cell
    }
    //MARK: - Edit
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "Edit", sender: self)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    //MARK: - Delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let commit = allNotes[indexPath.row]
            CoreDataStack.context.delete(commit)
            allNotes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            
            CoreDataStack.saveContext()
        
        }
    }
    //MARK: - Move
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = allNotes[sourceIndexPath.row]
        allNotes.remove(at: sourceIndexPath.row)
        allNotes.insert(item, at: destinationIndexPath.row)
    }
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allNotes.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? NoteCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        collectionCell.setupWith(note: allNotes[indexPath.row])
        
        return collectionCell
        
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Edit", sender: self)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "Edit" {
            if  let dest = segue.destination as? EditViewController {
                if let selectedIndex = tableView.indexPathForSelectedRow {
                    dest.thisNote = allNotes[selectedIndex.row]
                }
                
                if let selectedIndex = collectionView.indexPathsForSelectedItems?.first {
                    dest.thisNote = allNotes[selectedIndex.item]
                }
                
            }
        }
    }
        
    override func viewWillAppear(_ animated: Bool) {
        
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        do {
            let note = try! CoreDataStack.context.fetch(fetchRequest)
            self.allNotes = note
            self.tableView.reloadData()
        }
        
        tableView.reloadData()
        collectionView?.reloadData()
      //  var setting = Settings(darkMood: false, viewCell: false)
        tableView.isHidden = !setting.getTypeOfDisplayCell()
        collectionView.isHidden = setting.getTypeOfDisplayCell()
    }
    
}

