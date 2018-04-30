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
    internal var descr: String
    internal var url: String
    
    init(name: String, url: String, descr: String) {
        self.name = name
        self.url = url
        self.descr = descr
    }
}
