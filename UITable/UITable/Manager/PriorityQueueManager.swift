//
//  PriorityQueueManager.swift
//  UITable
//
//  Created by Sergii Lisnyi on 5/2/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class PriorityQueueManager: ATDControlProtocol {
    
    var delegate: FakeDataProtocol?
    var priority = 0
    
    func change(_ value: String) {
        let priority = Int(value)
        self.priority = priority ?? 0
    }
    
    func createMenu() -> [TypeDate] {
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "insert") {
            guard let data = self.delegate else { return }
            let value = String(data.modelData.count)
            if data.modelData.count == 0 {
                data.add(value: value, index: 0)
                data.modelData.setHelperValue(at: 0, helperValue: " - priority: " + String(self.priority))
            }
            else {
                let indexCurrent = data.modelData.getIndexWithBiggerPriority(priority: self.priority)
                data.add(value: value, index: indexCurrent)
                data.modelData.setHelperValue(at: indexCurrent, helperValue: " - priority: " + String(self.priority))
            }
           // data.commit()
        })
        
        arrayTypeData.append(TypeDate.textField(placeholder: "priority", keyboardType: .numberPad, action: change))
        
        arrayTypeData.append(TypeDate.button(title: "extract") {
            guard let data = self.delegate else { return }
            data.deleteToIndex(index: 0)
        })
        
        
        
        return arrayTypeData
    }
}
