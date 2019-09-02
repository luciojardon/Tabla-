//
//  CustomCell.swift
//  tabla
//
//  Created by Lucio Jardon on 8/29/19.
//  Copyright © 2019 Lucio Jardon. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
   
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var telefono: UILabel!
}


