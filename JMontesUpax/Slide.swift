//
//  Slide.swift
//  JMontesUpax
//
//  Created by Admin on 18/07/23.
//

import UIKit
import DGCharts

class Slide: UIView {

    @IBOutlet weak var lblPregunta: UILabel!
    @IBOutlet weak var viewPie: PieChartView!
    
    var respuestas: [Values] = []
            
            func setCollectionView(respuestas: [Values]) {
                self.respuestas = respuestas
                
                let collectionViewFlowLayout = UICollectionViewFlowLayout()
                collectionViewFlowLayout.itemSize = .init(width: 190, height: 50)
                
                
                let cvRespuestas = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
                cvRespuestas.translatesAutoresizingMaskIntoConstraints = false
                cvRespuestas.backgroundColor = UIColor.white.withAlphaComponent(0.0)
                cvRespuestas.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 10)
                
                cvRespuestas.register(UINib(nibName: "DataCollectionCell", bundle: nil), forCellWithReuseIdentifier: "DataCollectionCell")
                
                cvRespuestas.dataSource = self
                
                addSubview(cvRespuestas)
                
                NSLayoutConstraint.activate([
                    cvRespuestas.bottomAnchor.constraint(equalTo:  bottomAnchor),
                    cvRespuestas.leadingAnchor.constraint(equalTo: leadingAnchor),
                    cvRespuestas.trailingAnchor.constraint(equalTo: trailingAnchor),
                    cvRespuestas.topAnchor.constraint(equalTo: viewPie.bottomAnchor, constant: 20)
                ])
            }
    func SetPieChart() {
                
               
                var dataEntries : [ChartDataEntry] = []
                for i in 0 ..< respuestas.count {
                    let dataEntry = PieChartDataEntry(value: Double(respuestas[i].value), label: respuestas[i].label, data: respuestas[i].label as AnyObject)
                    dataEntries.append(dataEntry)
                }
                
                
                let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "")
                pieChartDataSet.colors = colorsOfCharts(numbersOfColor: respuestas.count)
                pieChartDataSet.sliceSpace = 5
                
                
                let legend = viewPie.legend
                legend.enabled = false
                
                
                let pieChartData = PieChartData(dataSet: pieChartDataSet)
                let format = NumberFormatter()
                format.numberStyle = .none
                let formatter = DefaultValueFormatter(formatter: format)
                pieChartData.setValueFormatter(formatter)
                
                pieChartData.setValueFont(.systemFont(ofSize: 0))
                
        viewPie.data = pieChartData
            }
    
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
               var colors: [UIColor] = []
               for i in 0..<6 {
                   let color = UIColor(named: "Color\(i)")
                   colors.append(color!)
               }
               return colors
           }
       }


// MARK: Extension Collection View
    extension Slide: UICollectionViewDataSource {
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return respuestas.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
            if let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCollectionCell", for: indexPath) as? DataCollectionCell {
                celda.lblNombre.text = "\(self.respuestas[indexPath.row].label) \(self.respuestas[indexPath.row].value)%"
                celda.imgColor.backgroundColor = UIColor(named: "Color\(indexPath.row)")!
                celda.imgColor.layer.cornerRadius = celda.frame.height/3
//                celda.imgColor.backgroundColor = UIColor.red
                
                return celda
            }
            
            return UICollectionViewCell()
        }
    }

