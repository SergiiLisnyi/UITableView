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
    
    func change(_ value: String) {
        self.value = value
    }
    
    func plusNumberOfRepetitions(_ value: String) -> String {
        guard value.count != 0  else { return " - 2 times"}
            let repeatition = Int(value.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
            return " - \(repeatition! + 1) times"
    }
    
    func minusNumberOfRepetitions(_ value: String) -> String {
        guard value != " - 2 times" else { return ""}
        let repeatition = Int(value.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
        return " - \(repeatition! - 1) times"
    }
    
        
    func createMenu() -> [TypeDate] {
        var arrayTypeData: Array<TypeDate> = []
        
        arrayTypeData.append(TypeDate.button(title: "add") {
            guard let data = self.delegate else { return }
            if data.modelData.contains(value: self.value) {
                let index = data.modelData.getIndex(value: self.value)
                let helper = data.modelData.getHelperValue(at: index)
                data.modelData.setHelperValue(at: index, helperValue: self.plusNumberOfRepetitions(helper))
               // data.commit()
                return
            }
            data.add(value: self.value, index: 0)
           // data.commit()
        })
        
        arrayTypeData.append(TypeDate.textField(placeholder: "value", keyboardType: .numberPad, action: change))
        
        arrayTypeData.append(TypeDate.button(title: "delete") {
            guard let data = self.delegate else { return }
            if data.modelData.contains(value: self.value) {
                let index = data.modelData.getIndex(value: self.value)
                let helper = data.modelData.getHelperValue(at: index)
                if helper.count == 0  {
                    print(helper)
                    data.deleteToIndex(index: index)
                } else {
                    data.modelData.setHelperValue(at: index, helperValue: self.minusNumberOfRepetitions(helper))
                    //data.commit()
                    return
                }
            }
            print ("set no have this value")
            return
            
        })
     
        return arrayTypeData
    }
}
