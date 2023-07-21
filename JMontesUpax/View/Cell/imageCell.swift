//
//  imageCell.swift
//  JMontesUpax
//
//  Created by Admin on 17/07/23.
//

import UIKit

class imageCell: UITableViewCell {
    
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var popUp: UIButton!
    
    @IBOutlet weak var btnFoto: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

     
        
       
    }
//    func convertToBase64() -> String{
//        let base64 = (imagen.image?.pngData()?.base64EncodedString())!
//                  //print("Base64 \(base64)")
//                  return base64
//       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//        pricipalController.self.imagenbase64 = convertToBase64()
    }
}
    
    
  


