//
//  TableViewCell.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/12/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class DataStructureViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
//    func initCell (name: String){
//        label.text = name
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


extension DataStructureViewCell: ConfigureCellProtocol {
    
    func configure(model: EntityProtocol) {
        //label.text = model.currentDataStruct?.name
        label.text = model.getName()
    }
}
