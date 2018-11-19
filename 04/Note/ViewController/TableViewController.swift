//
//  ViewController.swift
//  Note
//
//  Created by Vladyslav Zhulavskyi on 11/15/18.
//  Copyright © 2018 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Off AutoresizingMask
    var diaryTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let indentifier = "MyCell"
    var array = ["First title", "Second title", "Third title"]
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

        self.view.backgroundColor = .gray
        self.diaryTable.delegate = self
        self.diaryTable.dataSource = self
        diaryTable.register(UITableViewCell.self, forCellReuseIdentifier: indentifier)
        view.addSubview(diaryTable)
    //MARK: - Constraint UITableView
        self.diaryTable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5.0).isActive = true
        self.diaryTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 70.0).isActive = true
        self.diaryTable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5.0).isActive = true
        self.diaryTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5.0).isActive = true
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

