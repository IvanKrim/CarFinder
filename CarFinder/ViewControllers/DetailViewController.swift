//
//  DetailViewController.swift
//  CarFinder
//
//  Created by Юрий Чекалюк on 17.04.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var carPriceLabel: UILabel!
    
    @IBOutlet weak var carImageView: UIImageView!
    
    @IBOutlet weak var yearOfCarManufactureLabel: UILabel!
    @IBOutlet weak var carColorLabel: UILabel!
    @IBOutlet weak var carEngineLabel: UILabel!
    @IBOutlet weak var reserveButton: UIButton!
    
    
    
    //MARK: - Public Properties
    
    var car: Car!
    
    //MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.05896552652, green: 0.1820276678, blue: 0.2491934597, alpha: 1)
        reserveButton.layer.cornerRadius = 10
        carPriceLabel.layer.cornerRadius = 5
        carImageView.layer.cornerRadius = 10
        
        carModelLabel.text = car.fullVehicleInformation
        carPriceLabel.text = car.carPrice
        
        carImageView.image = UIImage(named: car.fullVehicleInformation)
        
        yearOfCarManufactureLabel.text = car.yearOfCarManufacture
        carColorLabel.text = car.carColor
        carEngineLabel.text = car.carEngine
        
    }
    
    // передаем модель и делегата на следующий контроллер
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let reserveVC = segue.destination as? ReserveViewController {
            reserveVC.car = car

        }
    }
}





