//
//  ArrayDataProtocol.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/13/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

protocol DataEntityProtocol {
    var count: Int { get }
    func getDataStructure(at: Int) -> EntityProtocol
}
