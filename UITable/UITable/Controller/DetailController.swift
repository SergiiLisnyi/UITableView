//
//  DetailController.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/16/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textLabel: UILabel!
    
    var model: DataStructureProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = model?.getDescr()
        self.title = model?.getName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
