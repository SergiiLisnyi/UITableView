//
//  VisualizationController.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/25/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class VisualizationController: UIViewController {

    @IBOutlet weak var stackForButtons: UIStackView!
    weak var tableController: FakeDataController?
    var adapter = Adapter()
    var control: ATDControlProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        control.setDelegate(delegate: tableController!) //FIXME FORCE
        adapter.place(control: control, view: stackForButtons)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? FakeDataController else { return }
        tableController = controller
    }
}

