//
//  FakeDataController.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/25/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class FakeDataController: UIViewController {

    @IBOutlet weak var dataTable: UITableView!
    var arrayValues = [(value: Int, state: Bool)]()
    //var arrayValues = [(value: 0, state: false), (value: 1, state: false),(value: 2, state: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    func addToStack() {
        let value = arrayValues.count
        arrayValues.insert((value: value, state: false), at: 0)
        dataTable.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    func addToArray() {
        let value = arrayValues.count
        arrayValues.append((value, false))
        dataTable.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        dataTable.reloadData()
    }
    
    func addToIndex(index: Int) {
        guard index < arrayValues.count  else { print ("Index out of range"); return }
        arrayValues.insert((value: index, state: false), at: index)
        dataTable.insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    func addToEnd() {
        let lastIndex = arrayValues.count
        arrayValues.insert((value: lastIndex, state: false), at: lastIndex)
        dataTable.insertRows(at: [IndexPath(row: lastIndex, section: 0)], with: .automatic)
    }
    
    func deleteToBegin() {
        arrayValues.remove(at: 0)
        dataTable.deleteRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    func deleteToEnd() {
        guard 0 < arrayValues.count  else { print ("Index out of range"); return }
        let lastIndex = arrayValues.count - 1
        arrayValues.remove(at: lastIndex)
        dataTable.deleteRows(at: [IndexPath(row: lastIndex, section: 0)], with: .automatic)
    }
    
    func deleteToIndex(index: Int) {
        guard index < arrayValues.count  else { print ("Index out of range"); return }
        arrayValues.remove(at: index)
        dataTable.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    func commit(){
        for i in 0..<arrayValues.count{
            arrayValues[i].state = true
        }
        dataTable.reloadData()
    }
}

extension FakeDataController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataTableCell.identifier, for: indexPath) as? DataTableCell else  {
            return UITableViewCell()
        }
        cell.label?.text = String(arrayValues[indexPath.row].value)
        if arrayValues[indexPath.row].state == true {
            cell.label.backgroundColor = UIColor.clear
        }
        else {
            cell.label.backgroundColor = UIColor.red
        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayValues.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
