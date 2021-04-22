//
//  FilterViewController.swift
//  CarFinder
//
//  Created by Юрий Чекалюк on 17.04.2021.
//

import UIKit

class FilterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: - Public Properties
    // не работает переход по сегвею с кнопки, разобраться
//    var listOfCars: [Car]!

    //MARK: - Private properties
    
    private let carModelsList = DataManager.shared.carModels
    // временный инициализатор
    private let listOfCars = Car.getCarInfo()
    private var foundedCar: Car?
    
    //MARK: - IB Outlets
    
    @IBOutlet weak var carBrandTextField: UITextField!
    
    @IBOutlet weak var carColorSC: UISegmentedControl!
    @IBOutlet weak var carEngineSC: UISegmentedControl!
    
    @IBOutlet weak var carYearSlider: UISlider!
    @IBOutlet weak var carPriceSlider: UISlider!
    
    @IBOutlet weak var carYearLabel: UILabel!
    @IBOutlet weak var carPriceLabel: UILabel!
    
    
    //MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        
        let picker = UIPickerView()
        carBrandTextField.inputView = picker
        picker.delegate = self
        
        // при загрузке экрана значения слайдеров в лейблах
        carYearLabel.text = String(Int(carYearSlider.value))
        carPriceLabel.text = String(Int(carPriceSlider.value))
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController {
            detailVC.car = foundedCar
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
        {
            view.endEditing(true) 
        }
    
    
    //MARK: - IB Actions
    
    // СЛАЙДЕРЫ: меняем значения лейблов
    @IBAction func carYearSliderChanged() {
        carYearLabel.text = String(Int(carYearSlider.value))
    }
    
    @IBAction func carPriceSliderChanged() {
        // округляем значения слайдера для лейбла
        let step: Float = 100000
        let currentSliderValue = round(carPriceSlider.value / step) * step
        carPriceLabel.text = String(Int(currentSliderValue))
    }
    
    // КНОПКА ПРИМЕНИТЬ: применяем фильтр к списку авто
    @IBAction func applyFilterButtonPressed() {
        
        compareCars(filteredCar: getFilteredCar())
        
        
        if let car = foundedCar {
            // черновая проверка работоспособности УДАЛИТЬ
            print(car.carModel, car.yearOfCarManufacture, car.carPrice)
            performSegue(withIdentifier: "segueFromFilterToDetail", sender: nil)
        } else {
            // черновая проверка работоспособности УДАЛИТЬ
            print("Такого авто нет в списке!")
            dismiss(animated: true, completion: nil)
            
//            alertCantFindCar()
            
        }
        
        
    }
    
    
    //MARK: - Public Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return carModelsList.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     return carModelsList[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        carBrandTextField.text = carModelsList[row]
    }
    
    //MARK: - Private Methods
    
    // получаем марку в фильтре
    private func getCarModel() -> String {
        return carBrandTextField.text ?? ""
        
    }
    
    // получаем цвет в фильтре
    private func getCarColor() -> String {
        var carColor = ""
        switch carColorSC.selectedSegmentIndex {
        case 0: carColor = "Синий"
        case 1: carColor = "Белый"
        default: carColor = "Красный"
        }
        return carColor
    }
    
    // получаем тип двигателя в фильтре
    private func getCarEngine() -> String {
        var carEngine = ""
        switch carEngineSC.selectedSegmentIndex {
        case 0: carEngine = "Бензин"
        case 1: carEngine = "Дизель"
        default: carEngine = "Электро"
        }
        return carEngine
    }
    
    // получаем год производства в фильтре
    private func getCarYear() -> String {
        let currentSliderValue = Int(round(carYearSlider.value))
        return String(currentSliderValue)

    }
    
    // получаем цену в фильтре
    private func getCarPrice() -> String {
        let currentSliderValue = Int(round(carPriceSlider.value))
        return String(currentSliderValue)
    }
    
    // получаем авто из отфильтрованных значений
    private func getFilteredCar() -> Car {
        let filteredCar = Car(
            carModel: getCarModel(),
            carColor: getCarColor(),
            carEngine: getCarEngine(),
            yearOfCarManufacture: getCarYear(),
            carPrice: getCarPrice()
        )
        // черновой принт, при сборке удалить
        print(filteredCar.carModel, filteredCar.carColor, filteredCar.carEngine,
              filteredCar.yearOfCarManufacture, filteredCar.carPrice)
        return filteredCar
    }
    
    // сравниваем отфильтрованное авто с авто в списке
    private func compareCars(filteredCar: Car) {
        
        for car in listOfCars {
            guard car.carModel == filteredCar.carModel else {continue}
            guard car.carColor == filteredCar.carColor else {continue}
            guard car.carEngine == filteredCar.carEngine else {continue}
            guard car.yearOfCarManufacture <= filteredCar.yearOfCarManufacture else {continue}
            guard car.carPrice <= filteredCar.carPrice else {continue}
            
            foundedCar = car
        }
    }
    
    // вызов алертконтроллер, если невозможно подобрать авто по фильтрам
    private func alertCantFindCar() {
        let alertController = UIAlertController(
            title: "Ошибка!",
            message: "Ничего не найдено. Попробуйте изменить фильтры.",
            preferredStyle: .alert
        )
        
        let okButton = UIAlertAction(
            title: "Попробовать снова",
            style: .default
        )
        alertController.addAction(okButton)
        alertController.present(self, animated: true)
        
    }

}

