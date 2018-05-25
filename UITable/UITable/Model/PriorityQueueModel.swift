//
//  PriorityQueueModel.swift
//  UITable
//
//  Created by Sergii Lisnyi on 5/3/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class PriorityQueueModel {
    
    
    var arrayValues: [(value: String, priority: String)]
    
    init() {
        arrayValues = []
    }
    
    var count: Int {
        return arrayValues.count
    }
    
    func insert(value: String, priority: String, at: Int) -> String {
        arrayValues.insert((value: value, priority: " - priority: " + priority), at: at)
        return value + " - priority: " + priority
    }
    
    func getIndexWithBiggerPriority (priority: Int) -> Int {
        for i in 0..<arrayValues.count {
            let tmp = Int((arrayValues[i].priority).components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
            if tmp! < priority { return i }
        }
        return arrayValues.count
    }
    
    var valueCount: String {
        return String(arrayValues.count)
    }
    
    func extract(index: Int) {
        guard 0 < arrayValues.count  else { print ("Index out of range"); return }
        arrayValues.remove(at: index)
    }
    
    func setPriority(at: Int, priority: String) {
        guard arrayValues.count != 0  else { print ("Index out of range"); return }
        arrayValues[at].priority = priority
    }
    
    
    func getPriority(at: Int) ->  String {
        return arrayValues[at].priority
    }
}
