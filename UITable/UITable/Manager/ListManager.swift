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
    let model = ListModel()
    
    func change(_ value: String) {
        guard let index = Int(value) else { return }
        self.index = index
    }
    
    func createMenu() -> [TypeDate] {
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "addByIndex") {
            guard let data = self.delegate, let index = self.index else { return }
            self.model.add(value: self.model.valueCount, index: index)
            data.add(value: self.model.valueCount, index: index)
            data.highLight(index: index)
        })
        
        arrayTypeData.append(TypeDate.button(title: "deleteByIndex") {
            guard let data = self.delegate, let index = self.index else { return }
            self.model.delete(index: index)
            data.deleteToIndex(index: index)
        })
        arrayTypeData.append(TypeDate.textField(placeholder: "index", keyboardType: .numberPad, action: change))
        return arrayTypeData
    }
}
