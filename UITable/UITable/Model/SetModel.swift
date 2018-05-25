//
//  SetModel.swift
//  UITable
//
//  Created by Sergii Lisnyi on 5/3/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class SetModel {
    
    var arrayValues: [String]
    
    init() {
        arrayValues = []
    }
    
    var count: Int {
        return arrayValues.count
    }
    
    func add(value: String) {
        arrayValues.insert(value, at: 0)
    }
    
    func contains(value: String) -> Int? {
        for i in 0..<arrayValues.count {
            if arrayValues[i] == value { return i}
        }
        return nil
    }
    
    func delete(index: Int) {
        guard 0 < arrayValues.count  else { print ("Index out of range"); return }
        arrayValues.remove(at: index)
    }
}
