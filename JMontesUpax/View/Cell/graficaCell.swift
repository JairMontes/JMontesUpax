//
//  graficaCell.swift
//  JMontesUpax
//
//  Created by Admin on 17/07/23.
//

import UIKit

class graficaCell: UITableViewCell {

   
    @IBOutlet weak var btnMostrar: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
//        self.btnMostrar.layer.cornerRadius = 30
//        self.btnMostrar.backgroundColor = UIColor(hue: 282/360, saturation: 23/100, brightness: 84/100, alpha: 1.0)
        btnMostrar.layer.borderWidth = 5
        btnMostrar.layer.borderColor = UIColor.purple.cgColor
        btnMostrar.titleLabel?.font =  UIFont(name: "Arial", size: 25)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
