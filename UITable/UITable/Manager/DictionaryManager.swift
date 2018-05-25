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
    let model = DictionaryModel()
    
    func changeValue(_ value: String) {
        self.value = value
    }
    
    func changeKey(_ key: String) {
        self.key = key
    }
    
    func createMenu() -> [TypeDate] {
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "add") {
            guard let data = self.delegate else { return }
            if let index = self.model.contains(key: self.key) {
                print ("set contains this key")
                data.highLight(index: nil)
                data.highLight(index: index)
                return
            }
            else if self.model.count == 0 {
                data.highLight(index: nil)
                data.add(value: self.key + " - value: " + self.value, index: 0)
                self.model.add(value: self.value, key: self.key, at: 0)
                data.highLight(index: 0)
                
            }
            else {
                data.highLight(index: nil)
                let indexCurrent = self.model.getIndexWithBiggerKey (key: self.key)
                data.add(value: self.key + " - value: " + self.value, index: indexCurrent)
                self.model.add(value: self.value, key: self.key, at: indexCurrent)
                data.highLight(index: indexCurrent)
            }
        })
        
        arrayTypeData.append(TypeDate.button(title: "delete") {
            guard let data = self.delegate else { return }
             if let index = self.model.contains(key: self.key) {
                data.highLight(index: nil)
                data.highLight(index: index)
                data.deleteToIndex(index: index)
                self.model.delete(index: index)
            }
            print ("set no have this key")
        })
        arrayTypeData.append(TypeDate.textField(placeholder: "key", keyboardType: .alphabet, action: changeKey))
        arrayTypeData.append(TypeDate.textField(placeholder: "value", keyboardType: .numberPad, action: changeValue))
        
        return arrayTypeData
    }
}
