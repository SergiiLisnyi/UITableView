//
//  DictionaryModel.swift
//  UITable
//
//  Created by Sergii Lisnyi on 5/3/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class DictionaryModel {
    
    var arrayValues: [(value: String, key: String)]
    
    init() {
        arrayValues = []
    }
    
    var count: Int {
        return arrayValues.count
    }
    
    func add(value: String, key: String, at: Int) {
         arrayValues.insert((value: value, key: key), at: at)
    }
    
    func contains(key: String) -> Int? {
        for i in 0..<arrayValues.count {
            if arrayValues[i].key == key { return i }
        }
        return nil
    }
    
    func delete(index: Int) {
        guard 0 < arrayValues.count  else { print ("Index out of range"); return }
        arrayValues.remove(at: index)
    }
    
    func getIndexWithBiggerKey (key: String) -> Int {
        for i in 0..<arrayValues.count {
            let tmp = arrayValues[i].key
            if tmp > key {
                return i
            }
        }
        return arrayValues.count
    }  
}
