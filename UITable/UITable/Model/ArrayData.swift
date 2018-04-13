//
//  ArrayData.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/13/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//
class ArrayData : ArrayDataProtocol {

    var arrayDataStructure : [String] = ["Stack", "Queue", "Set", "Dequeue", "Priority Queue", "List(Array)", "MultiSet", "Dictionary"]
    
    func count() -> Int {
        return arrayDataStructure.count
    }
    
    func add(nameStructure: String) {
        arrayDataStructure.append(nameStructure)
    }
    
    func getDataStructure(at: Int) -> String {
        return arrayDataStructure[at]
    }
    
}
