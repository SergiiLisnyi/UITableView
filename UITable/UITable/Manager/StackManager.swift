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
    
    func createMenu() -> [TypeDate] {
        
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "push") {
            guard let data = self.delegate else { return }
            let value = String(data.modelData.count)
            
            data.add(value: value, index: 0)
            data.highLight(arr: [0])
            
        })
        
        arrayTypeData.append(TypeDate.button(title: "pop") {
            guard let data = self.delegate else { return }
            data.deleteToIndex(index: 0)
            data.highLight(arr: [0])
        })
        return arrayTypeData
    }
}
