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
    
    func createMenu() -> [TypeDate] {
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "pushBack") {
            guard let data = self.delegate else { return }
            let index = 0
            let value = String(data.modelData.count)
            self.delegate?.add(value: value, index: index)
        })
        
        arrayTypeData.append(TypeDate.button(title: "pushFront") {
            guard let data = self.delegate else { return }
            let value = String(data.modelData.count)
            let index = data.modelData.count
            guard index >= 0  else { print ("Index out of range"); return }
            self.delegate?.add(value: value, index: index)
        })
        
        arrayTypeData.append(TypeDate.button(title: "popBack") {
            guard let data = self.delegate else { return }
            data.deleteToIndex(index: 0)
        })
        
        arrayTypeData.append(TypeDate.button(title: "popFront") {
            guard let data = self.delegate else { return }
            
            let index = data.modelData.count - 1
            guard index >= 0  else { print ("Index out of range"); return }
            data.deleteToIndex(index: index)
        })
        
        arrayTypeData.append(TypeDate.button(title: "commit") {
            guard let data = self.delegate else { return }
           // data.commit()
        })
        return arrayTypeData
    }
}
