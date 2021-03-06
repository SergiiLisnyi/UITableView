//
//  MultiSetManager.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/30/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class MultiSetManager: ATDControlProtocol {
    
    var delegate: FakeDataProtocol?
    var value = ""
    let model = MultiSetModel()
    
    func change(_ value: String) {
        self.value = value
    }
    
    func createMenu() -> [TypeDate] {
        var arrayTypeData: Array<TypeDate> = []
        
        arrayTypeData.append(TypeDate.button(title: "add") {
            guard let data = self.delegate else { return }
            
            if let index = self.model.contains(value: self.value) {
                let repetition = self.model.plusNumberOfRepetitions(at: index)
                self.model.setRepetition(at: index, repetition: repetition)
                data.highLight(index: nil)
                data.deleteToIndex(index: index)
                data.add(value: self.value + repetition, index: index)
                data.highLight(index: index)
            } else {
                data.highLight(index: nil)
                self.model.add(value: self.value, repetition: "")
                data.add(value: self.value, index: 0)
                data.highLight(index: 0)
            }
        })
        
        arrayTypeData.append(TypeDate.textField(placeholder: "value", keyboardType: .numberPad, action: change))
        
        arrayTypeData.append(TypeDate.button(title: "delete") {
            guard let data = self.delegate else { return }

            if let index = self.model.contains(value: self.value) {
                data.highLight(index: nil)
                data.highLight(index: index)
                data.deleteToIndex(index: index)
                let repetition = self.model.getRepetition(at: index)
                if repetition.count == 0  {
                    self.model.delete(index: index)
                } else {
                    self.model.setRepetition(at: index, repetition: self.model.minusNumberOfRepetitions(repetition))
                    data.add(value: self.value + self.model.minusNumberOfRepetitions(repetition), index: index)
                    return
                }
            }
            print ("set no have this value")
            return
        })
        return arrayTypeData
    }
}
