//
//  DataStructure.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/13/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

struct  DataStructureEntity: EntityProtocol  {
    
    private var name: String
    private var descr: String
    
    init(name: String, descr: String) {
        self.name = name
        self.descr = descr
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getDescr() -> String {
        return self.descr
    }
}
