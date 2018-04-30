//
//  Adapter.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/27/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation
import  UIKit

class Adapter {
    
    func place(control: ATDControlProtocol, view: UIStackView){
        let arr: [TypeDate] = control.createMenu()
       
        for typeDate in arr {
            switch typeDate {
            case .button(let title, let action):
                view.addArrangedSubview(ActionButton(title: title, action: action))
        
            case .textField(let title, let action):
                view.addArrangedSubview(ActionTextField(title: title, action: action))
            }
        }
    }
}

enum TypeDate {
    case button(title: String, action: ()->()) //MARK FIXME ()?
    case textField(title: String, action: (String)->())
    
//    func getTitle() -> String {
//        switch self {
//        case .button(let title, _):
//            return title
//        case .textField(let title, _):
//            return title
//        }
//    }
//    
//    func getAction() -> (String)->() {
//        switch self {
//        case .button(_, let action):
//            return action
//        case .textField(_, let action):
//            return action
//        }
//    }
    
}
