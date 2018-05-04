//
//  DataTableCell.swift
//  UITable
//
//  Created by Sergii Lisnyi on 4/25/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class DataTableCell: UITableViewCell {
    
    static let identifier = "customCell"
    
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
