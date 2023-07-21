//
//  dataViewModel.swift
//  JMontesUpax
//
//  Created by Admin on 17/07/23.
//

import Foundation
import FirebaseFirestore

let db = Firestore.firestore()
var ref: DocumentReference? = nil


class DataViewModel {
    
    static func Get(resp: @escaping(HTTPURLResponse?, Root?, Error?) -> Void){
           let url = URL(string: "https://s3.amazonaws.com/dev.reports.files/test.json")
           
           URLSession.shared.dataTask(with: url!) { data, response, error in
               if let httpResponse = response as? HTTPURLResponse{
                   if let dataSource = data{
                       let decoder = JSONDecoder()
                       let root = try! decoder.decode(Root.self, from: dataSource)
                       resp(httpResponse, root, nil)
                   }
               }
               if let errorSource  = error{
                   resp(nil, nil, errorSource)
               }
           } .resume()
       }
    
    static func Add(celda: Celdas) -> Result {
        var result = Result()
        
        ref = db.collection("celdas").addDocument(data: [
            "nombre": celda.nombre,
            "imagen": celda.imagen
        ]) { [self] err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        return result
    }
    }

