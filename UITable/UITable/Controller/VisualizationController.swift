//
//  VisualizationController.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/25/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class VisualizationController: UIViewController {

    weak var tableController: FakeDataController?
    var model: EntityProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = model?.getName()
        createButton(title: "Add", action: #selector(buttonActionAdd), x: 30, y: 80 )
        createButton(title: "Del", action: #selector(buttonActionDel), x: 170, y: 80 )
        createButton(title: "Commit", action: #selector(buttonActionCommit), x: 310, y: 80 )
    }
    
    func createButton(title: String, action: Selector, x: Int, y: Int) {
        let button = UIButton()
        button.frame = CGRect(x: x, y: y, width: 70, height: 40)
        button.backgroundColor = UIColor.gray
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func buttonActionAdd(sender: UIButton!) {
        tableController?.addToStack()
    }
    
    @objc func buttonActionDel(sender: UIButton!) {
        tableController?.deleteToBegin()
    }
    
    @objc func buttonActionCommit(sender: UIButton!) {
        tableController?.commit()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? FakeDataController else { return }
        tableController = controller
    }
}

