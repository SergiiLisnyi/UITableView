//
//  FakeDataProtocol.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/27/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

protocol FakeDataProtocol : class {
    
    func deleteToIndex(index: Int)
    func add(value: String, index: Int)
    func highLight(index: Int?)
}
