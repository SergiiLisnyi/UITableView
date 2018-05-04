//
//  DequeuManager.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/30/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class DequeueManager: ATDControlProtocol {
    
    var delegate: FakeDataProtocol?
    let model = DequeueModel()
    
    func createMenu() -> [TypeDate] {
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "pushBack") {
            guard let data = self.delegate else { return }
            self.model.pushBack(value: self.model.valueCount)
            data.add(value: self.model.valueCount, index: 0)
            data.highLight(index: 0)
        })
        
        arrayTypeData.append(TypeDate.button(title: "pushFront") {
            guard let data = self.delegate else { return }
            if let index = self.model.pushFront(value: self.model.valueCount) {
                data.add(value: self.model.valueCount, index: index)
                data.highLight(index: index)
            }
        })

        arrayTypeData.append(TypeDate.button(title: "popBack") {
            guard let data = self.delegate else { return }
            self.model.popBack()
            data.deleteToIndex(index: 0)
        })
        
        arrayTypeData.append(TypeDate.button(title: "popFront") {
            guard let data = self.delegate else { return }
            if let index = self.model.popFront() {
                data.deleteToIndex(index: index)
            }
        })
        return arrayTypeData
    }
}
