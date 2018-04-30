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
    
    func setDelegate(delegate: FakeDataProtocol) {
        self.delegate = delegate
    }
    
    func createMenu() -> [TypeDate] {
        var arrayTypeData: Array<TypeDate> = []
        arrayTypeData.append(TypeDate.button(title: "enqueue") {
            guard let data = self.delegate else { return }
            let index = 0
            let value = String(data.modelData.count)
            data.add(value: value, index: index)
        })
        
        arrayTypeData.append(TypeDate.button(title: "dequeue") {
            guard let data = self.delegate else { return }

            let index = data.modelData.count - 1
            guard index >= 0  else { print ("Index out of range"); return }
            data.deleteToIndex(index: index)
        })
        
        arrayTypeData.append(TypeDate.button(title: "commit") {
            guard let data = self.delegate else { return }
            data.commit()
        })
        return arrayTypeData
    }
}
