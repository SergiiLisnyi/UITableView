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
    var indexLight = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func add(value: String, index: Int) {
        guard index <= arrayValues.count  else { print ("Index out of range"); return }
        guard value.count != 0 else { print ("Empty value"); return }
        arrayValues.insert(value, at: index)
        dataTable.insertRows(at: [IndexPath(row: index, section: 0)], with: .top)
    }
    
    func deleteToIndex(index: Int) {
        guard index < arrayValues.count  else { print ("Index out of range"); return }
        arrayValues.remove(at: index)
        dataTable.deleteRows(at: [IndexPath(row: index, section: 0)], with: .bottom)
    }
    
    func highLight(index: Int?) {
        guard let index = index else {
            let cell = dataTable.cellForRow(at: IndexPath(row: indexLight, section: 0)) as? DataTableCell
            cell?.configureWith(text: arrayValues[indexLight], light: false)
            return
        }
            indexLight = index
            let cell = dataTable.cellForRow(at: IndexPath(row: index, section: 0)) as? DataTableCell
            cell?.configureWith(text: arrayValues[index], light: true)
    }
}

extension FakeDataController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataTableCell.identifier, for: indexPath) as? DataTableCell else  {
            return UITableViewCell()
        }
       // cell.configureWith(text: arrayValues[indexPath.row], light: indexLight == indexPath.row)
        return cell
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayValues.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
