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
    
    init(title: String, action: @escaping (String)->()) {
        super.init(frame: .zero)
        self.action = action
        self.borderStyle = UITextBorderStyle.roundedRect
        self.backgroundColor = UIColor.yellow
        self.keyboardType = UIKeyboardType.decimalPad
        self.delegate = self;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: TextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            let txtAfterUpdate = text.replacingCharacters(in: range, with: string)

            //limit count
            if txtAfterUpdate.count > 3 {
                return false
            }
            action!(txtAfterUpdate)
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
            
    } // became first responder
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print ("end edit")
      //  textField.resignFirstResponder()
        return true
    }
        
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        print ("end did edit")
        textField.resignFirstResponder()
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print ("clear")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //self.resignFirstResponder()
        return true
    }
    
}


