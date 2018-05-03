//
//  ControlManagerFactory.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/26/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class ControlManagerFactory  {
    
    static func getManager(model: EntityProtocol) -> ATDControlProtocol {
        switch model.type {
        case DataType.Stack:
            return StackManager()
        case DataType.Queue:
            return QueueManager()
        case DataType.Set:
            return SetManager()
        case DataType.MultiSet:
            return MultiSetManager()
        case DataType.Dequeu:
            return DequeueManager()
        case DataType.List:
            return ListManager()
        case DataType.PriorityQueue:
            return PriorityQueueManager()
        case DataType.Dictionary:
            return DictionaryManager()
        }
    }
    
}
