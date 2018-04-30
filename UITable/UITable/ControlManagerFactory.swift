//
//  ControlManagerFactory.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/26/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class ControlManagerFactory  {
    
    static func getManager(model: EntityProtocol) -> ATDControlProtocol {
        let title = model.name
        switch title {
        case "Stack":
            return StackManager()
        case "Queue":
            return QueueManager()
        case "Set":
            return SetManager()
        case "MultiSet":
            return MultiSetManager()
        case "Dequeue":
            return DequeueManager()
        default:
            return StackManager()
        }
    }
    
}
