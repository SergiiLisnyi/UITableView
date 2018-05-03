//
//  ModelFakeData.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/26/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class ModelFakeData {
  
    var arrayValues: [(value: String, helperValue: String, isCommit: Bool)]
    
    init() {
        arrayValues = []
    }
   
    var count: Int {
        return arrayValues.count
    }
    
    func insert(value: String, helperValue: String, state: Bool, at: Int) {
         arrayValues.insert((value: value, helperValue: helperValue, isCommit: state), at: at)
    }
    
    func remove(at: Int) {
        arrayValues.remove(at: at)
    }
    
    func contains(value: String) -> Bool {
        for i in arrayValues {
            if i.value == value { return true}
        }
        return false
    }
    
    func getIndex(value: String) -> Int {
        for i in 0..<arrayValues.count {
            if arrayValues[i].value == value { return i }
        }
        return -1
    }
    
    func getIndexWithBiggerPriority (priority: Int) -> Int {
        if priority == 0 {
            return arrayValues.count
        }
        else {
            for i in 0..<arrayValues.count {
                let tmp = Int((arrayValues[i].helperValue).components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
                if tmp! < priority { return i }
            }
        }
        return arrayValues.count
    }
    
    
    func getIndexWithBiggerKey (key: String) -> Int {
            for i in 0..<arrayValues.count {
                let tmp = arrayValues[i].value
                if tmp > key {
                    return i
                }
            }
        return arrayValues.count
    }
    
    
    
    func append (value: String, helperValue: String, state: Bool) {
       arrayValues.append((value, helperValue, state))
    }
    
    func getState(at: Int) ->  Bool {
        return arrayValues[at].isCommit
    }
    
    func getValue(at: Int) ->  String {
        return arrayValues[at].value
    }
    
    func getModel(at: Int) -> (value: String, helperValue: String, isCommit: Bool) {
        return arrayValues[at]
    }
    
    func setState(at: Int, state: Bool) {
        guard arrayValues.count >= 0  else { print ("Index out of range"); return }
        print(at)
        arrayValues[at].isCommit = state
    }
    
    func setValue(at: Int, value: String) {
        arrayValues[at].value = value
    }
    
    func setHelperValue(at: Int, helperValue: String) {
        guard arrayValues.count != 0  else { print ("Index out of range"); return }
        arrayValues[at].helperValue = helperValue
    }
    
    func getHelperValue(at: Int) ->  String {
        return arrayValues[at].helperValue
    }
}
