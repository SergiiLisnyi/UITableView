//
//  ActionButton.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/27/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation
import UIKit


class ActionButton : UIButton {
    
    var action: (()->())?
    
    init(title: String, action: @escaping ()->()) {
        super.init(frame: .zero)
        self.action = action
        self.backgroundColor = UIColor.gray
        self.setTitle(title, for: .normal)
        self.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 12)
        self.addTarget(self, action: #selector(callFunc), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func callFunc() {
        action?()
    }
  
}
