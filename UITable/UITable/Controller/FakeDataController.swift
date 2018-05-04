//
//  FakeDataController.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/25/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class FakeDataController: UIViewController, FakeDataProtocol {
  

    @IBOutlet weak var dataTable: UITableView!
    
    var arrayValues: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func add(value: String, index: Int) {
        guard index <= arrayValues.count  else { print ("Index out of range"); return }
        guard value.count != 0 else { print ("Empty value"); return }
        arrayValues.insert(value, at: index)
        dataTable.insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    func deleteToIndex(index: Int) {
        guard index < arrayValues.count  else { print ("Index out of range"); return }
        arrayValues.remove(at: index)
        dataTable.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    func highLight(arr: [Int]) {
//        for i in 0..<modelData.count{
//            modelData.setState(at: i, state: true)
//        }
//        for i in 0..<arr.count{
//            modelData.setState(at: arr[i], state: false)
//        }
//        dataTable.reloadData()
    }
}

extension FakeDataController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataTableCell.identifier, for: indexPath) as? DataTableCell else  {
            return UITableViewCell()
        }
        cell.label.text = arrayValues[indexPath.row]
        
        //cell.label.backgroundColor = UIColor.red
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayValues.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
