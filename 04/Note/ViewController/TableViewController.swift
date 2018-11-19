//
//  ViewController.swift
//  Note
//
//  Created by Vladyslav Zhulavskyi on 11/15/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var diaryTable = UITableView()
    let indentifier = "MyCell"
    var array = ["2", "3", "5"]
    override func viewDidLoad() {
        super.viewDidLoad()
        CreateTable()
    }
    
    @IBAction func add(_ sender: Any) {
    }
    @IBAction func edit(_ sender: Any) {
        diaryTable.isEditing = !diaryTable.isEditing
    }
    func CreateTable() {
        self.diaryTable = UITableView(frame: view.bounds, style: .plain)
        self.diaryTable.delegate = self
        self.diaryTable.dataSource = self
        diaryTable.register(UITableViewCell.self, forCellReuseIdentifier: indentifier)
        view.addSubview(diaryTable)
        diaryTable.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    //MARK: - Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    //MARK: - Edit
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Edit", sender: indexPath)
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    //MARK: - Delete
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    //MARK: - Move
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = array[sourceIndexPath.row]
        array.remove(at: sourceIndexPath.row)
        array.insert(item, at: destinationIndexPath.row)
    }
}

