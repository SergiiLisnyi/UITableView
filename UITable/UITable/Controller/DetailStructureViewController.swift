//
//  StructureViewController.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/13/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class DetailStructureViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    var nameStructure: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = nameStructure
    }
}
