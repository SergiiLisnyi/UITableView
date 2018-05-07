//
//  DataStructure.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/13/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

struct  DataStructureEntity: EntityProtocol  {
    
    internal var name: String
    internal let type: DataType
    internal var definition: String
    internal var url: String?
    
    init(name: String, type: DataType, url: String? = nil, definition: String) {
        self.name = name
        self.type = type
        self.url = url
        self.definition = definition
    }
}

enum DataType : String {
    case Stack = "Stack"
    case Queue = "Queue"
    case Set = "Set"
    case Dequeu = "Dequeu"
    case PriorityQueue = "PriorityQueue"
    case List = "List"
    case MultiSet = "MultiSet"
    case Dictionary = "Dictionary"
}
