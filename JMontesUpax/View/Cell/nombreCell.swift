//
//  nombreCell.swift
//  JMontesUpax
//
//  Created by Admin on 17/07/23.
//

import UIKit

class nombreCell: UITableViewCell, UITextFieldDelegate {

   
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var txtNombre: UITextField!
  
//    static var nombre : String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtNombre.delegate =  self
        txtNombre.placeholder = "Agrega un nombre"
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        pricipalController.self.nombre = txtNombre.text!
        print(txtNombre.text)
    }
}
