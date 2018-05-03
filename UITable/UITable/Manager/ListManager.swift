//
//  ListManager.swift
//  UITable
//
//  Created by Sergii Lisnyi on 5/2/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class ListManager: ATDControlProtocol {
    
    var delegate: FakeDataProtocol?
    var index: Int!
    
    func change(_ value: String) {
        guard let index = Int(value) else { return }
        self.index = index
    }
    
    func createMenu() -> [TypeDate] {
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "addByIndex") {
            guard let data = self.delegate, let index = self.index else { return }
            let value = String(data.modelData.count)
            data.add(value: value, index: index)
        })
        
        arrayTypeData.append(TypeDate.button(title: "deleteByIndex") {
            guard let data = self.delegate, let index = self.index else { return }
            data.deleteToIndex(index: index)
        })
        
        arrayTypeData.append(TypeDate.textField(placeholder: "index", keyboardType: .numberPad, action: change))
        
        arrayTypeData.append(TypeDate.button(title: "commit") {
            guard let data = self.delegate else { return }
           // data.commit()
        })
        return arrayTypeData
    }
}
