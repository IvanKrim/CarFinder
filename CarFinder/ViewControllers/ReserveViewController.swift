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
    @IBOutlet weak var addAnotherOrderButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    //MARK: - Public Properties
    var car: Car!
    
    //MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        createOrderButton.layer.cornerRadius = 10
        addAnotherOrderButton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
        view.backgroundColor = #colorLiteral(red: 0.05896552652, green: 0.1820276678, blue: 0.2491934597, alpha: 1)
        carModelLabel.text = car.fullVehicleInformation
        
        if DataManager.shared.reservedCarsInCart.count > 0 {
            detailLabel.text = "Пожалуйста, подтвердите добавление \(car.fullVehicleInformation) к существующему заказу"
            customerNameTF.isHidden = true
            customerPhoneTF.isHidden = true
            createOrderButton.isHidden = true
            addAnotherOrderButton.isHidden = false
        } else {
            addAnotherOrderButton.isHidden = true
            cancelButton.isHidden = true
        }

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
    
    @IBAction func addAnotherButtonPressed() {
        showAlertToAnotherReserve(
            title: "Благодарим за заказ!",
            message: "Ваш заказ добавлен к списку заказов."
        )
        addNewCar()
    }

    @IBAction func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
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
        let reservedCar = Cart(carModel: car.carModel, carColor: car.carColor, carPrice: car.carPrice)
        DataManager.shared.reservedCarsInCart.append(reservedCar)
    }
}

// Alert Controller
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
    
    //Алерт для последующих заказов, когда в корзине есть уже минимум 1 заказ
    private func showAlertToAnotherReserve(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okActionButton = UIAlertAction(title: "OK", style: .default) { dismissReserveVC in self.dismiss(animated: true, completion: nil) }
        alert.addAction(okActionButton)
        present(alert, animated: true)
}
    
    
    
    
    
}

