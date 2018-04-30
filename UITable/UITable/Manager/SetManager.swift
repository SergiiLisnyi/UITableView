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
    
    func setDelegate(delegate: FakeDataProtocol) {
        self.delegate = delegate
    }
    
    func change(_ value: String) {
        self.value = value
    }
    
    func createMenu() -> [TypeDate] {
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "add") {
            guard let data = self.delegate else { return }

            if data.modelData.contains(value: self.value) {
                print ("set contains this value")
                let index = data.modelData.getIndex(value: self.value)
                data.light(index: index)
                return
            }
            data.add(value: self.value, index: 0)
        })
        
        arrayTypeData.append(TypeDate.button(title: "delete") {
            guard let data = self.delegate else { return }
            
            if data.modelData.contains(value: self.value) {
                data.deleteToIndex(index: data.modelData.getIndex(value: self.value))
            }
                print ("set no have this value")
            return
            
        })
        
        arrayTypeData.append(TypeDate.textField(title: "enterValue", action: change))
        
        arrayTypeData.append(TypeDate.button(title: "commit") {
            guard let data = self.delegate else { return }
            data.commit()
        })
        return arrayTypeData
    }
}
