//
//  ActionTextField.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/30/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation
import UIKit

class ActionTextField: UITextField, UITextFieldDelegate {
    
    var action: ((String)->())?
    
    init(placeholder: String, keyboardType: UIKeyboardType, action: @escaping (String)->()) {
        super.init(frame: .zero)
        self.action = action
        self.borderStyle = UITextBorderStyle.roundedRect
        self.backgroundColor = UIColor.yellow
        self.keyboardType = keyboardType
        self.placeholder = placeholder
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: TextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            let txtAfterUpdate = text.replacingCharacters(in: range, with: string)
            action?(txtAfterUpdate)
        }
        return true
    }
}


