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
    weak var dataController: FakeDataController?
    let adapter: AdapterProtocol = Adapter()
    var control: ATDControlProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let dataController = dataController else { return }
        control.delegate = dataController
        adapter.createMenu(control: control, view: stackForButtons)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? FakeDataController else { return }
        dataController = controller
    }
}

