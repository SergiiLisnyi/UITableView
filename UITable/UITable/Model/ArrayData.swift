//
//  ArrayData.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/13/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class ArrayData : DataEntityProtocol {
    
    private let dataStack = DataStructureEntity(name: DataType.Stack.rawValue, type: .Stack,
                                                url: getInfo(typeInfo: "url",typeData: .Stack), definition: getInfo(typeInfo: "descr",typeData: .Stack))
    
    private let dataQueue = DataStructureEntity(name: DataType.Queue.rawValue, type: .Queue,
                                                url: getInfo(typeInfo: "url",typeData: .Queue), definition: getInfo(typeInfo: "descr",typeData: .Queue))
    
    private let dataSet = DataStructureEntity(name: DataType.Set.rawValue, type: .Set,
                                              url: getInfo(typeInfo: "url",typeData: .Set), definition: getInfo(typeInfo: "descr",typeData: .Set))
    
    private let dataDequeu = DataStructureEntity(name: DataType.Dequeu.rawValue, type: .Dequeu,
                                                 url: getInfo(typeInfo: "url",typeData: .Dequeu), definition: getInfo(typeInfo: "descr",typeData: .Dequeu))
    
    private let dataPriorityQueue = DataStructureEntity(name: DataType.PriorityQueue.rawValue, type: .PriorityQueue,
                                                        url: getInfo(typeInfo: "url",typeData: .PriorityQueue), definition: getInfo(typeInfo: "descr",typeData: .PriorityQueue))
    
    private let dataList = DataStructureEntity(name: DataType.List.rawValue, type: .List,
                                               url: getInfo(typeInfo: "url",typeData: .List), definition: getInfo(typeInfo: "descr",typeData: .List))
    
    private let dataMultiSet = DataStructureEntity(name: DataType.MultiSet.rawValue, type: .MultiSet,
                                                   url: getInfo(typeInfo: "url",typeData: .MultiSet), definition: getInfo(typeInfo: "descr",typeData: .MultiSet))
    
    private let dataDictionary = DataStructureEntity(name: DataType.Dictionary.rawValue, type: .Dictionary,
                                                     url: getInfo(typeInfo: "url",typeData: .Dictionary), definition: getInfo(typeInfo: "descr",typeData: .Dictionary))
    
    
    private var arrayDataStructure : [DataStructureEntity] = []
    
    init() {
        arrayDataStructure.append(dataStack)
        arrayDataStructure.append(dataQueue)
        arrayDataStructure.append(dataSet)
        arrayDataStructure.append(dataDequeu)
        arrayDataStructure.append(dataPriorityQueue)
        arrayDataStructure.append(dataList)
        arrayDataStructure.append(dataMultiSet)
        arrayDataStructure.append(dataDictionary)
    }
    
    static func getInfo(typeInfo: String, typeData: DataType) -> String? {
        guard let path = Bundle.main.path(forResource: "InfoDataStructure", ofType: "plist") else { return nil }
        guard let dict = NSDictionary(contentsOfFile: path) else { return nil }
        guard let value = dict.value(forKey: typeData.rawValue) as? NSDictionary else { return nil }
            let url = value[typeInfo] as? String
            return url
    }
  
    var count: Int {
        return arrayDataStructure.count
    }
    
    func getDataStructure(at: Int) -> EntityProtocol {
        return arrayDataStructure[at]
    }
  
}
























