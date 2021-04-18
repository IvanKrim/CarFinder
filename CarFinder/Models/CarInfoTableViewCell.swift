//
//  CarInfoTableViewCell.swift
//  CarFinder
//
//  Created by Кирилл Нескоромный on 18.04.2021.
//

import UIKit

// здесь кастомный класс для нашей ячейки

class CarInfoTableViewCell: UITableViewCell {
    
    // аутлеты для лейблов внутри ячейки

    @IBOutlet weak var nameYearLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // функция передающая свойства экземпляра в тектовые поля аутлетов, принимает объект с типом модели
    func cellSetup(object: Car) {
        
        self.nameYearLabel.text = object.fullVehicleInformation
        self.colorLabel.text = object.carColor
        self.priceLabel.text = object.carPrice
    }

}
