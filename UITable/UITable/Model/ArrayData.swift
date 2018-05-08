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
    
    private let dataQueue = DataStructureEntity(name: DataType.Queue.rawValue, type: DataType.Queue,
                                                url: getInfo(typeInfo: "url",typeData: .Queue), definition: getInfo(typeInfo: "descr",typeData: .Queue))
    
    private let dataSet = DataStructureEntity(name: DataType.Set.rawValue, type: DataType.Set,
                                              url: getInfo(typeInfo: "url",typeData: .Set), definition: getInfo(typeInfo: "descr",typeData: .Set))
    
    private let dataDequeu = DataStructureEntity(name: DataType.Dequeu.rawValue, type: DataType.Dequeu,
                                                 url: getInfo(typeInfo: "url",typeData: .Dequeu), definition: getInfo(typeInfo: "descr",typeData: .Dequeu))
    
    private let dataPriorityQueue = DataStructureEntity(name: DataType.PriorityQueue.rawValue, type: DataType.PriorityQueue,
                                                        url: getInfo(typeInfo: "url",typeData: .PriorityQueue), definition: getInfo(typeInfo: "descr",typeData: .PriorityQueue))
    
    private let dataList = DataStructureEntity(name: DataType.List.rawValue, type: DataType.List,
                                               url: getInfo(typeInfo: "url",typeData: .List), definition: getInfo(typeInfo: "descr",typeData: .List))
    
    private let dataMultiSet = DataStructureEntity(name: DataType.MultiSet.rawValue, type: DataType.MultiSet,
                                                   url: getInfo(typeInfo: "url",typeData: .MultiSet), definition: getInfo(typeInfo: "descr",typeData: .MultiSet))
    
    private let dataDictionary = DataStructureEntity(name: DataType.Dictionary.rawValue, type: DataType.Dictionary,
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
        var myDict: NSDictionary?
        let pathPlist = Bundle.main.path(forResource: "InfoDataStructure", ofType: "plist")
        if let path = pathPlist {
            myDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = myDict {
            if let value = dict.value(forKey: typeData.rawValue) as? NSDictionary {
                let url = value[typeInfo] as? String
                return url
            }
        }
        return nil
    }
  
    var count: Int {
        return arrayDataStructure.count
    }
    
    func getDataStructure(at: Int) -> EntityProtocol {
        return arrayDataStructure[at]
    }
  
}
























