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
    
    func createMenu() -> [TypeDate] {
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "enqueue") {
            guard let data = self.delegate else { return }
            let value = String(data.modelData.count)
            data.add(value: value, index: 0)
            data.highLight(arr: [0, data.modelData.count-1])
        })
        
        arrayTypeData.append(TypeDate.button(title: "dequeue") {
            guard let data = self.delegate else { return }

            let index = data.modelData.count - 1
            guard index >= 0  else { print ("Index out of range"); return }
            data.highLight(arr: [0, index-1])
            data.deleteToIndex(index: index)
            
        })

        return arrayTypeData
    }
}
