//
//  QueueModel.swift
//  UITable
//
//  Created by Sergii Lisnyi on 5/3/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class QueueModel {
    
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
    
    func enqueue(value: String) {
        arrayValues.insert(value, at: 0)
    }
    
    func dequeue() -> Int? {
        guard 0 < arrayValues.count  else { print ("Index out of range"); return nil }
        let index = arrayValues.count - 1
        arrayValues.remove(at: index)
        return index
    }
}
