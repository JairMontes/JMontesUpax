//
//  fotoController.swift
//  JMontesUpax
//
//  Created by Admin on 17/07/23.
//

import UIKit

class fotoController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var popUp: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var viewButton: UIView!
    
    
    let imagePickerController = UIImagePickerController()
//    let photoPickerController = UIImagePickerController()

    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        imagePickerController.delegate = self
               imagePickerController.isEditing = false
        
        self.viewButton.layer.cornerRadius = 25
        self.btnAdd.layer.cornerRadius = 25
        self.btnAdd.backgroundColor = UIColor(hue: 190/360, saturation: 37/100, brightness: 84/100, alpha: 1.0)
      
        popUpButton()
    }
    
    
    @IBAction func btnAdd(_ sender: Any) {
//                var celda = Celdas()
//
//                celda.nombre = pricipalController.self.nombre
//                celda.imagen = convertToBase64()
//
//                let result = DataViewModel.Add(celda: celda)
//        let alert = UIAlertController(title: "Mensaje", message: "nombre insertado", preferredStyle: .alert)
//                    let action = UIAlertAction(title: "Aceptar", style: .default)
//
//                    alert.addAction(action)
//
//                    self.present(alert, animated: true, completion: nil)
      
                dismiss(animated: true)
    }
    func convertToBase64() -> String{
        let base64 = (imageView.image?.pngData()?.base64EncodedString())!
//        imageCell.self.imagenbase64 = base64
                  return base64
        
      
       }

//}


func popUpButton() {
    let optionClosure = {(action: UIAction) in
        print(action.title)}
    
    popUp.menu = UIMenu(children : [
//        UIAction(title: "Tomar/Elegir foto", handler: optionClosure),
       
        UIAction(title: "Tomar foto", image: UIImage(systemName: "camera.fill"), state: .on, handler: { [self] (_) in
            print("Estas presionando tomar foto")
//            photoPickerController.delegate = self
            imagePickerController.sourceType = .camera
//            photoPickerController.isEditing = false
            self.present(imagePickerController, animated: true)
               }),
        UIAction(title: "Elegir foto", image: UIImage(systemName: "photo"), state: .on ,handler: { [self] (_) in
            print("Estas presionando elegir foto")
//            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
//            imagePickerController.isEditing = false
            self.present(self.imagePickerController, animated: true)
            
               })
    ])
    
   
    
    popUp.showsMenuAsPrimaryAction = true
    popUp.changesSelectionAsPrimaryAction = true
}

}


extension fotoController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
       

        let data = info[.originalImage]
        self.imageView.image = info[.originalImage] as! UIImage

        dismiss(animated: true)
        
       
   }
    func photoPickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        
        
        
        
        let data = info[.originalImage]
        self.imageView.image = info[.originalImage] as! UIImage

        dismiss(animated: true)
        
       
   }
    
    }
