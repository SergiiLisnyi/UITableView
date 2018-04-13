//
//  ArrayDataProtocol.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/13/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

protocol ArrayDataProtocol {
    
    func count() -> Int
    
    func add(nameStructure: String)
    
    func getDataStructure(at: Int) -> String 
}
