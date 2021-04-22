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
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var customerNameTF: UITextField!
    @IBOutlet weak var customerPhoneTF: UITextField!
    
    @IBOutlet weak var createOrderButton: UIButton!
    
    //MARK: - Public Properties
    var car: Car!
//    var delegate: ReserveVCDelegate! УДАЛИТЬ
//    var customerContacts = "" УДАЛИТЬ
    
    //MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.7470981479, green: 0.8530337214, blue: 0.9378386736, alpha: 1)
        
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
    
    
    //Функция, которая собирает заказанную машину для добавления в массив
    private func addNewCar() {
        let carInCart = Cart(carModel: car.carModel, carColor: car.carColor, carPrice: car.carPrice)
        DataManager.shared.reservedCarsInCart.append(carInCart)
    }
    
    
    
    
}


    //MARK: Alert Controller
extension ReserveViewController {
    
    // добавление AlertController
    private func showAlertLogic(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        // Кнопка ОК + замыкание, которое выключает окно с TF для контактных данных, так пользователь увидит сверху корзину.
        let okActionButton = UIAlertAction(title: "OK", style: .default) { dismissReserveVC in self.dismiss(animated: true, completion: nil) }
        alert.addAction(okActionButton)
        present(alert, animated: true)
        
    }
    // вынесен за класс временно
    private func showAlert() {
        if customerNameTF.text == "" || customerPhoneTF.text == "" {
            showAlertLogic(
                title: "Ошибка",
                message: "Пожалуйста, укажите Имя и контактный номер телефона."
            )
            
        } else {
            addNewCar()
            showAlertLogic(
                title: "Благодарим за заказ!",
                message: "\(customerNameTF.text ?? ""), наш менеджер скоро с вами свяжется. \n Ваш заказ находится в корзине."
            )
        }
    }
    
    
    
    
}

