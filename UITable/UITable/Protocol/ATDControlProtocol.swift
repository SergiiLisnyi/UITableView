//
//  ATDControlProtocol.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/26/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

protocol ATDControlProtocol {
    
    var delegate: FakeDataProtocol? {get set}
    func createMenu() -> [TypeDate]
}
