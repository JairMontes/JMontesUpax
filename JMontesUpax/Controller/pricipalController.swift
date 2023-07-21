//
//  pricipalController.swift
//  JMontesUpax
//
//  Created by Admin on 17/07/23.
//

import UIKit


class pricipalController: UIViewController {

    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    static var nombre: String = ""
    static var imagenbase64: String = ""
//    static var imagen: String = ""
//    var nombre : String = ""
    
    let imagePicker = UIImagePickerController()
  
    override func viewDidLoad() {
        super.viewDidLoad()

       
       self.btnAdd.layer.cornerRadius = 25
        self.btnAdd.backgroundColor = UIColor(hue: 190/360, saturation: 37/100, brightness: 84/100, alpha: 1.0)

        tableView.register(UINib(nibName: "nombreCell", bundle: .main), forCellReuseIdentifier:"nombreCell")
        tableView.register(UINib(nibName: "imageCell", bundle: .main), forCellReuseIdentifier:"imageCell")
        tableView.register(UINib(nibName: "graficaCell", bundle: .main), forCellReuseIdentifier:"graficaCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        

    }

    @IBAction func btnAdd(_ sender: Any) {
        var celda = Celdas()

        celda.nombre = pricipalController.self.nombre
        celda.imagen = pricipalController.self.imagenbase64

        let result = DataViewModel.Add(celda: celda)
let alert = UIAlertController(title: "Mensaje", message: "información insertada correctamente", preferredStyle: .alert)
            let action = UIAlertAction(title: "Aceptar", style: .default)

            alert.addAction(action)

            self.present(alert, animated: true, completion: nil)
        dismiss(animated: true)
    }

}
    

extension pricipalController :UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
     
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "nombreCell", for: indexPath) as! nombreCell
            
            cell.txtNombre.addTarget(self, action: #selector(regex(_:)), for: .editingChanged)
            
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! imageCell
           
                       cell.btnFoto.addTarget(self, action: #selector(showPopUp), for: .touchUpInside)
                            return cell
        case 2:
                        let cell = tableView.dequeueReusableCell(withIdentifier: "graficaCell", for: indexPath) as! graficaCell
            
            cell.btnMostrar.addTarget(self, action: #selector(mostrarGraficos), for: .touchUpInside)
                        return cell
        default:
            return UITableViewCell()
        }
        
    }

    @objc
        func showPopUp(){
            self.performSegue(withIdentifier: "seguePhoto", sender: self)
            
    }
    @objc
        func mostrarGraficos(){
            self.performSegue(withIdentifier: "segueGraficos", sender: self)
            
    }
    @objc
       func regex(_ textField: UITextField) {
           if let text = textField.text{
               let filteredText = text.filter{$0.isLetter || $0.isWhitespace} //verifica si cada cadena de texto es alfabetica
               textField.text = String(filteredText)
           }

           
       }
   }





