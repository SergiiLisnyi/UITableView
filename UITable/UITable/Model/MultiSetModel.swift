//
//  MultiSetManager.swift
//  UITable
//
//  Created by Sergii Lisnyi on 5/3/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class MultiSetModel {
    
    var arrayValues: [(value: String, repetition: String)]
    
    init() {
        arrayValues = []
    }
    
    var count: Int {
        return arrayValues.count
    }
    
    func add(value: String, repetition: String) {
        arrayValues.insert((value ,repetition), at: 0)
    }
    
    func contains(value: String) -> Int? {
        for i in 0..<arrayValues.count {
            if arrayValues[i].value == value { return i}
        }
        return nil
    }
    
    func delete(index: Int) {
        guard 0 < arrayValues.count  else { print ("Index out of range"); return }
        arrayValues.remove(at: index)
    }
    
    func setRepetition(at: Int, repetition: String) {
        guard arrayValues.count != 0  else { print ("Index out of range"); return }
        arrayValues[at].repetition = repetition
    }
    
    
    func getRepetition(at: Int) ->  String {
        return arrayValues[at].repetition
    }
    
    func plusNumberOfRepetitions(at: Int) -> String {
        
        let repeatition = arrayValues[at].repetition
        guard repeatition.count != 0  else { return " - 2 times"}
        let repeatitions = Int(repeatition.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
        return " - \(repeatitions! + 1 ) times"
    }
    
    func minusNumberOfRepetitions(_ value: String) -> String {
        guard value != " - 2 times" else { return ""}
        let repeatition = Int(value.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
        return " - \(repeatition! - 1) times"
    }
    
}
