//
//  InsumoTableViewCell.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/10/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class InsumoTableViewCell: UITableViewCell {

    @IBOutlet var nombreInsumo:UILabel!
    @IBOutlet var costoInsumo:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
