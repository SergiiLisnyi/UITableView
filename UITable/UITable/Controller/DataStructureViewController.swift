//
//  TableViewController.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/12/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class DataStructureViewController: UITableViewController {

    private let storyBoardID = "storyBoardID"
    private let cellIdentifier = "SimpleTextLabel"
    private let modelDataStructure = ArrayData()
    private let colorSeparator = UIColor.black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelDataStructure.initModel()
        setSeparator(color: colorSeparator)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelDataStructure.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DataStructureViewCell else {
            return UITableViewCell()
        }
        cell.configure(model: getModelPrototype(indexPath.row))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailStoryBoard = storyboard.instantiateViewController(withIdentifier: storyBoardID) as? DetailController else { return }
        detailStoryBoard.model = getModelPrototype(indexPath.row)
        self.navigationController?.pushViewController(detailStoryBoard, animated: true)

//        print("Select cell with index: \(indexPath.row)")
//        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func getModelPrototype(_ index: Int) -> DataStructureProtocol{
        return modelDataStructure.getDataStructure(at: index)
    }
    
    func setSeparator(color: UIColor){
        self.tableView.separatorColor = color
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow?.row else { return }
        guard let destination = segue.destination as? DetailStructureViewController else { return }
        destination.nameStructure = modelDataStructure.getDataStructureName(at: index)
    }*/
}
