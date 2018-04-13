//
//  ArrayData.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/13/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//
class ArrayData : ArrayDataProtocol {
    
    private let dataStack = DataStructure(name: "Stack")
    private let dataQueue = DataStructure(name: "Queue")
    private let dataSet = DataStructure(name: "Set")
    private let dataDequeu = DataStructure(name: "Dequeue")
    private let dataPriorityQueue = DataStructure(name: "Priority Queue")
    private let dataList = DataStructure(name: "List(Array)")
    private let dataMultiSet = DataStructure(name: "MultiSet")
    private let dataDictionary = DataStructure(name: "Dictionary")
    
    private var arrayDataStructure : [DataStructure] = []
    
    func initModel() {
        arrayDataStructure.append(dataStack)
        arrayDataStructure.append(dataQueue)
        arrayDataStructure.append(dataSet)
        arrayDataStructure.append(dataDequeu)
        arrayDataStructure.append(dataPriorityQueue)
        arrayDataStructure.append(dataList)
        arrayDataStructure.append(dataMultiSet)
        arrayDataStructure.append(dataDictionary)
    }

    var count: Int {
        return arrayDataStructure.count
    }
    
    func getDataStructureName(at: Int) -> String {
        return arrayDataStructure[at].name
    }
    
}
