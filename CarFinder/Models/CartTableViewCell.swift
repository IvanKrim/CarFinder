//
//  CartTableViewCell.swift
//  CarFinder
//
//  Created by Юрий Чекалюк on 20.04.2021.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    //MARK: IB Outlets
    //аутлеты для лэйблов внутри ячейки
    @IBOutlet weak var nameYearLabel: UILabel!
    @IBOutlet weak var carColorLabel: UILabel!
    @IBOutlet weak var carPriceLabel: UILabel!

    // функция передающая свойства экземпляра в тектовые поля аутлетов, принимает объект с типом модели
    func cellSetup(object: Cart) {
        
        nameYearLabel.text = object.carModel
        carColorLabel.text = object.carColor
        carPriceLabel.text = object.carPrice
    }
    
}
