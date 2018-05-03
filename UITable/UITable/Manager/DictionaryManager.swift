//
//  DictionaryManager.swift
//  UITable
//
//  Created by Sergii Lisnyi on 5/2/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class DictionaryManager: ATDControlProtocol {
    
    var delegate: FakeDataProtocol?
    var value = ""
    var key = ""
    
    func change(_ value: String) {
        self.value = value
    }
    
    func changeKey(_ key: String) {
        self.key = key
    }
    
    func createMenu() -> [TypeDate] {
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "add") {
            guard let data = self.delegate else { return }
            
            if data.modelData.contains(value: self.key) {
                print ("set contains this key")
                let index = data.modelData.getIndex(value: self.key)
                data.highLight(arr: [index])
                return
            }
            if data.modelData.count == 0 {
                data.add(value: self.key, index: 0)
                data.modelData.setHelperValue(at: 0, helperValue: " - value: " + self.value)
            }
            else {
                let indexCurrent = data.modelData.getIndexWithBiggerKey (key: self.key)
                data.add(value: self.key, index: indexCurrent)
                data.modelData.setHelperValue(at: indexCurrent, helperValue: " - value: " + String(self.value))
            }
           // data.commit()
        })
        
        arrayTypeData.append(TypeDate.button(title: "delete") {
            guard let data = self.delegate else { return }
            if data.modelData.contains(value: self.key) {
                data.deleteToIndex(index: data.modelData.getIndex(value: self.key))
            }
            print ("set no have this key")
            return
        })
        
        arrayTypeData.append(TypeDate.textField(placeholder: "key", keyboardType: .alphabet, action: changeKey))
        
        arrayTypeData.append(TypeDate.textField(placeholder: "value", keyboardType: .numberPad, action: change))
        
        return arrayTypeData
    }
}
