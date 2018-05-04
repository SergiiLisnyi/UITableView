//
//  StackModel.swift
//  UITable
//
//  Created by Sergii Lisnyi on 5/3/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class StackModel {
   
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
    
    func push(value: String) {
        arrayValues.insert(value, at: 0)
    }
    
    func pop() {
        guard 0 < arrayValues.count  else { print ("Index out of range"); return }
        arrayValues.remove(at: 0)
    }
}
