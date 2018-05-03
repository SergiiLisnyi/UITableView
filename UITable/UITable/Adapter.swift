//
//  Adapter.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/27/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation
import  UIKit

class Adapter: AdapterProtocol {

    func createMenu(control: ATDControlProtocol, view: UIStackView) {
        let arr: [TypeDate] = control.createMenu()
       
        for typeDate in arr {
            switch typeDate {
            case .button(let title, let action):
                view.addArrangedSubview(ActionButton(title: title, action: action))
        
            case .textField(let placeholder, let keyboardType, let action):
                view.addArrangedSubview(ActionTextField(placeholder: placeholder, keyboardType: keyboardType, action: action))
            }
        }
    }
}

enum TypeDate {
    case button(title: String, action: ()->()) //MARK FIXME ()?
    case textField(placeholder: String, keyboardType: UIKeyboardType, action: (String)->())
}
