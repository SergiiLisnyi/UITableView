//
//  DequeueModel.swift
//  UITable
//
//  Created by Sergii Lisnyi on 5/3/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class DequeueModel {
    
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
    
    func pushBack(value: String) {
        arrayValues.insert(value, at: 0)
    }
    
    func pushFront(value: String) -> Int? {
        let index = arrayValues.count
        arrayValues.insert(value, at: index)
        return index
    }
    
    func popFront() -> Int? {
        guard 0 < arrayValues.count  else { print ("Index out of range"); return nil }
        let index = arrayValues.count - 1
        arrayValues.remove(at: index)
        return index
    }
    
    func popBack() {
        guard 0 < arrayValues.count  else { print ("Index out of range"); return }
        arrayValues.remove(at: 0)
    }
}
