//
//  ArrayData.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/13/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//
class ArrayData : ArrayDataProtocol {
    
    private let dataStack = DataStructureEntity(name: "Stack")
    private let dataQueue = DataStructureEntity(name: "Queue")
    private let dataSet = DataStructureEntity(name: "Set")
    private let dataDequeu = DataStructureEntity(name: "Dequeue")
    private let dataPriorityQueue = DataStructureEntity(name: "Priority Queue")
    private let dataList = DataStructureEntity(name: "List(Array)")
    private let dataMultiSet = DataStructureEntity(name: "MultiSet")
    private let dataDictionary = DataStructureEntity(name: "Dictionary")
    
    private var arrayDataStructure : [DataStructureEntity] = []
    
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
    
    func getDataStructure(at: Int) -> DataStructureProtocol {
        return arrayDataStructure[at]
    }
    
    
}
