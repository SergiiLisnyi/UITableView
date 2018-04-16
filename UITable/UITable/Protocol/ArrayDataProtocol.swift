//
//  ArrayDataProtocol.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/13/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

protocol ArrayDataProtocol {
    var count: Int { get }
    
    func initModel()
    func getDataStructureName(at: Int) -> String
}
