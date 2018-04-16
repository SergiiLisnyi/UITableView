//
//  DataStructure.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/13/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

struct  DataStructure : DataStructureProtocol {
    
    var name: String
    
    func configure(name: String, cell: DataStructureViewCell) {
            cell.label.text = name
    }
}
