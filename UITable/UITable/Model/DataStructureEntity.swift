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
    private var wikiURL: String
    
    init(name: String, wikiURL: String, descr: String) {
        self.name = name
        self.wikiURL = wikiURL
        self.descr = descr
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getDescr() -> String {
        return self.descr
    }
    
    func getURL() -> String {
        return self.wikiURL
    }
}
