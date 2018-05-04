//
//  QueueManager.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/27/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class QueueManager: ATDControlProtocol {
    
    var delegate: FakeDataProtocol?
    let model = QueueModel()
    
    func createMenu() -> [TypeDate] {
        
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "enqueue") {
            guard let data = self.delegate else { return }
            self.model.enqueue(value: self.model.valueCount)
            data.highLight(index: nil)
            data.add(value: self.model.valueCount, index: 0)
            data.highLight(index: 0)
        })
        
        arrayTypeData.append(TypeDate.button(title: "dequeue") {
            guard let data = self.delegate else { return }
            if let index = self.model.dequeue(){
                data.highLight(index: nil)
                data.highLight(index: index)
                data.deleteToIndex(index: index)
            }
        })
        return arrayTypeData
    }
}
