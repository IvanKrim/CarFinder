//
//  DetailViewController.swift
//  CarFinder
//
//  Created by Юрий Чекалюк on 17.04.2021.
//

import UIKit

// создаем протокол для класса
protocol ReserveVCDelegate {
    func printCustomerInfo(
        name: String,
        phoneNumber: String,
        selectedCar: String)
}

class DetailViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var carPriceLabel: UILabel!
    
    @IBOutlet weak var carImageView: UIImageView!
    
    @IBOutlet weak var yearOfCarManufactureLabel: UILabel!
    @IBOutlet weak var carColorLabel: UILabel!
    @IBOutlet weak var carEngineLabel: UILabel!
    
    
    //MARK: - Public Properties
    
    var car: Car!
    
    //MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
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
            reserveVC.delegate = self
        }
    }
}

// расширение, описывающее метод
extension DetailViewController: ReserveVCDelegate {
    func printCustomerInfo(
        name: String,
        phoneNumber: String,
        selectedCar: String
    ) {
        print("Покупатель \(name), телефон: \(phoneNumber) забронировал \(selectedCar)"
        )
    }

}
