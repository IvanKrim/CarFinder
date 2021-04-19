//
//  ReserveViewController.swift
//  CarFinder
//
//  Created by Юрий Чекалюк on 17.04.2021.
//

import UIKit

// подписал класс под протокол UITextFieldDelegate для работы с клавиатурой
class ReserveViewController: UIViewController, UITextFieldDelegate {

    //MARK: - IB Outlets
    @IBOutlet weak var carModelLabel: UILabel!
    
    @IBOutlet weak var customerNameTF: UITextField!
    @IBOutlet weak var customerPhoneTF: UITextField!
    
    
    //MARK: - Public Properties
    
    var car: Car!
    
    var customerContacts: [String] = []
    
    //MARK: - Override Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.8049663901, green: 0.7776784301, blue: 0.8425303102, alpha: 1)
        
        carModelLabel.text = car.fullVehicleInformation
        
        customerNameTF.delegate = self
        customerPhoneTF.delegate = self
    }
    
    // добавляем метод для программирования кнопки return на клавиатуре
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == customerNameTF {
            customerPhoneTF.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}
