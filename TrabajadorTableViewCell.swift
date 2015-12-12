//
//  TrabajadorTableViewCell.swift
//  ContaCafeParse
//
//  Created by Aplimovil on 12/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class TrabajadorTableViewCell: UITableViewCell {
    
    @IBOutlet var nombreTrabajador: UILabel!
    @IBOutlet var klu: UILabel!
    @IBOutlet var kma: UILabel!
    @IBOutlet var kmi: UILabel!
    @IBOutlet var kju: UILabel!
    @IBOutlet var kvi: UILabel!
    @IBOutlet var ksa: UILabel!
    @IBOutlet var kdo: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
