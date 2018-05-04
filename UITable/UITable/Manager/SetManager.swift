//
//  SetManager.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/30/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class SetManager: ATDControlProtocol {
    
    var delegate: FakeDataProtocol?
    var value = ""
    let model = SetModel()
    
    func change(_ value: String) {
        self.value = value
    }
    
    func createMenu() -> [TypeDate] {
        
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "add") {
            guard let data = self.delegate else { return }
            if let index = self.model.contains(value: self.value) {
                print ("set contains this value")
               // data.highLight(arr: [index])
            } else {
            self.model.add(value: self.value)
            data.add(value: self.value, index: 0)
            }
        })
        arrayTypeData.append(TypeDate.button(title: "delete") {
            guard let data = self.delegate else { return }
            if let index = self.model.contains(value: self.value) {
                data.deleteToIndex(index: index)
                self.model.delete(index: index)
            } else {
                print ("set no have this value")
            }
        })
        arrayTypeData.append(TypeDate.textField(placeholder: "value", keyboardType: .numberPad, action: change))
        return arrayTypeData
    }
}
