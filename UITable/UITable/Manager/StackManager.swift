//
//  StackManager.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/26/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class StackManager: ATDControlProtocol {
    
    var delegate: FakeDataProtocol?
    let model = StackModel()
    
    func createMenu() -> [TypeDate] {
        
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "push") {
            guard let data = self.delegate else { return }
            self.model.push(value: self.model.valueCount)
            data.add(value: self.model.valueCount, index: 0)
        })
        
        arrayTypeData.append(TypeDate.button(title: "pop") {
            guard let data = self.delegate else { return }
            self.model.pop()
            data.deleteToIndex(index: 0)
        })
        return arrayTypeData
    }
}
