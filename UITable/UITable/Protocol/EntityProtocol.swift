//
//  DataStructureProtocol.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/17/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

protocol EntityProtocol {
    var name: String { get }
    var type: DataType { get }
    var definition: String { get }
    var url: String? { get }
}
