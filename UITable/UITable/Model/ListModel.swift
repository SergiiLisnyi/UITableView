//
//  ListModel.swift
//  UITable
//
//  Created by Sergii Lisnyi on 5/3/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class ListModel {
    
    var arrayValues: [String]
    
    init() {
        arrayValues = []
    }
    
    var count: Int {
        return arrayValues.count
    }
    
    var valueCount: String {
        return String(arrayValues.count)
    }
    
    func add(value: String, index: Int) {
        guard index <= arrayValues.count  else { print ("Index out of range"); return }
        arrayValues.insert(value, at: index)
    }
    
    func delete(index: Int) {
        guard 0 < arrayValues.count  else { print ("Index out of range"); return }
        arrayValues.remove(at: index)
    }
}
