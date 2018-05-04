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
    let model = PriorityQueueModel()
    
    func change(_ value: String) {
        let priority = Int(value)
        self.priority = priority ?? 0
    }
    
    func createMenu() -> [TypeDate] {
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "insert") {
            guard let data = self.delegate else { return }
            
            if self.model.count == 0 {
                let fullNameTitle = self.model.insert(value: self.model.valueCount, priority: String(self.priority), at: 0)
                data.add(value: fullNameTitle, index: 0)
            }
            else {
                let indexCurrent = self.model.getIndexWithBiggerPriority(priority: self.priority)
                let fullNameTitle = self.model.insert(value: self.model.valueCount, priority: String(self.priority), at: indexCurrent )
                data.add(value: fullNameTitle, index: indexCurrent)
            }
        })
        
        arrayTypeData.append(TypeDate.textField(placeholder: "priority", keyboardType: .numberPad, action: change))
        
        arrayTypeData.append(TypeDate.button(title: "extract") {
            guard let data = self.delegate else { return }
            self.model.extract(index: 0)
            data.deleteToIndex(index: 0)
        })
        return arrayTypeData
    }
}
