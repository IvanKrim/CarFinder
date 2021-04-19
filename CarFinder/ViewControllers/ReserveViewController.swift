//
//  ReserveViewController.swift
//  CarFinder
//
//  Created by Юрий Чекалюк on 17.04.2021.
//

import UIKit

class ReserveViewController: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var carModelLabel: UILabel!
    
    @IBOutlet weak var customerNameTF: UITextField!
    @IBOutlet weak var customerPhoneTF: UITextField!
    
    
    //MARK: - Public Properties
    
    var car: Car!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.8049663901, green: 0.7776784301, blue: 0.8425303102, alpha: 1)
        
        carModelLabel.text = car.fullVehicleInformation
    }
}
