//
//  TableViewCell.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/12/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    func initCell (name: String){
        label.text = name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
