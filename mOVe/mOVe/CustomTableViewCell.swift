//
//  CustomTableViewCell.swift
//  mOVe
//
//  Created by 哈哈 on 2022/5/20.
//  Copyright © 2022 MengHeng. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var numberEquipLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
