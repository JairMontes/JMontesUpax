//
//  ViewController.swift
//  JMontesUpax
//
//  Created by Admin on 28/06/23.
//

import UIKit
import FirebaseDatabase
import Hex

class randomColorController: UIViewController {
    
  
    @IBOutlet weak var viewColor: UIView!
    
    var ref: DatabaseReference!
    var BackgroundColor : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        //        add(color: "FFE4A7")
        GetAll()
        //        view.backgroundColor = UIColor(hex: BackgroundColor.last!)
    }
    
    @IBAction func btnCambioColor(_ sender: Any) {
        
        let random = coloraletorio()
        add(color: random)
        
    }
    
    
    
    func add(color : String) {
        
        self.ref.child("Color").childByAutoId().setValue(color)
    }
    
        
        func coloraletorio() -> String{
            let red = Int.random(in: 0...255)
            let green = Int.random(in: 0...255)
            let blue = Int.random(in: 0...255)
            
            return String(format: "#%02X%02X%02X", red, green,blue)
        }
        
        
        func GetAll() {
            self.ref.child("Color").observe(.value) { snapshot in
                //        self.ref.child("Color").getData(completion: { error, snapshot in
                //            let value = snapshot
                //            guard error == nil else {
                //                print(error!.localizedDescription)
                //                return;
                //            }
                if let valores = snapshot.children.allObjects as? [DataSnapshot] {
                    for valor in valores {
                        let color = valor.value as! String
                        self.BackgroundColor.append(color)
                    }
                    DispatchQueue.main.async {
                        self.viewColor.backgroundColor = UIColor(hex: self.BackgroundColor.last!)
                        //                }
                        //            }
                        //        });
                    }
                }
            }
        }
    }


