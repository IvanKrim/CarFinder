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
    var delegate: ReserveVCDelegate!
    
    var customerContacts = ""
    
    //MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8049663901, green: 0.7776784301, blue: 0.8425303102, alpha: 1)
        
        carModelLabel.text = car.fullVehicleInformation
        
        customerNameTF.delegate = self
        customerPhoneTF.delegate = self
        
    }
    
    // скрываем клавиатуру тапом по экрну
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    //MARK: - IB Actions
    @IBAction func callMeButtonPressed() {
        showAlert()
        
    }
    
    
    //MARK: - Public methods
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


extension ReserveViewController {
    
    // добавление AlertController
    private func showAlertLogic(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        // Кнопка ОК
        let okActionButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okActionButton)
        
        present(alert, animated: true)
    }
    // вынесен за класс временно
    private func showAlert() {
        if customerNameTF.text == "" || customerPhoneTF.text == "" {
            showAlertLogic(
                title: "Ошибка",
                message: "Пожалуйста, укажите Имя и контактынй номер телефона."
            )
            
        } else {
            showAlertLogic(
                title: "Благодарим за заказ!",
                message: "\(customerNameTF.text ?? "" ), наш менеджер скоро с вами свяжется."
            )
            customerContacts.append(customerNameTF.text ?? "")
            
        }
    }
    
}
