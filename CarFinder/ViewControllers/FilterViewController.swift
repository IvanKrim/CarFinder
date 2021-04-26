//
//  FilterViewController.swift
//  CarFinder
//
//  Created by Юрий Чекалюк on 17.04.2021.
//

import UIKit

class FilterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: - Public Properties
    
    var listOfCars = Car.getCarInfo()
    
    //MARK: - Private properties
    
    private let carModelsList = DataManager.shared.carModels
    private let carColorList = DataManager.shared.carColors
    
    private var changeFilter: Int = 0
    
    private var foundedCar: Car?
    
    //MARK: - IB Outlets
    
    @IBOutlet weak var carBrandTextField: UITextField!
    @IBOutlet weak var carColorTextField: UITextField!
    
    @IBOutlet weak var carEngineSC: UISegmentedControl!
    
    @IBOutlet weak var carYearSlider: UISlider!
    @IBOutlet weak var carPriceSlider: UISlider!
    
    @IBOutlet weak var carYearLabel: UILabel!
    @IBOutlet weak var carPriceLabel: UILabel!
    
    @IBOutlet weak var applyFilterButton: UIButton!
    @IBOutlet weak var showResultButton: UIButton!
    
    //MARK: - Override Methods
    
    let pickerModel = UIPickerView()
    let pickerColor = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.05896552652, green: 0.1820276678, blue: 0.2491934597, alpha: 1)
        
        applyFilterButton.layer.cornerRadius = applyFilterButton.frame.height / 5
        showResultButton.layer.cornerRadius = showResultButton.frame.height / 5

        carBrandTextField.inputView = pickerModel
        carColorTextField.inputView = pickerColor
        
        pickerModel.delegate = self
        pickerColor.delegate = self
        
        // при загрузке экрана значения слайдеров в лейблах
        carYearLabel.text = String(Int(carYearSlider.value))
        carPriceLabel.text = String(Int(carPriceSlider.value)) + " руб."
        
        // прячем кнопку Показать
        showResultButton.isHidden = true
        
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
        carPriceLabel.text = String(Int(currentSliderValue)) + " руб."
    }
    
    // КНОПКА ПРИМЕНИТЬ: применяем фильтр к списку авто
    @IBAction func applyFilterButtonPressed() {
        
        compareCars(filteredCar: getFilteredCar())
        
        showAlert(filter: helperInFilter(changeFilter: changeFilter))
    }
    
    // КНОПКА ПОКАЗАТЬ: переход на detailVC
    @IBAction func showResultButtonPressed() {
        
    }
    
    //MARK: - Public Methods
    
    //убираем дубликаты из элементов массива
    func removeDuplicateElements(array: [String]) -> [String] {
        var arrayWithUniqueElements: [String] = []
        for item in array {
            if !arrayWithUniqueElements.contains(item) {
                arrayWithUniqueElements.append(item)
            }
        }
        return arrayWithUniqueElements
    }
    
    
    
    // настройка pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case pickerModel:
            return carModelsList.count
        default:
            return removeDuplicateElements(array: carColorList).count
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case pickerModel:
            return carModelsList[row]
        default:
            return removeDuplicateElements(array: carColorList)[row]
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case pickerModel:
            carBrandTextField.text = carModelsList[row]
        default:
            carColorTextField.text = removeDuplicateElements(array: carColorList)[row]
        }
        
    }
    
    //MARK: - Private Methods
    
    // получаем марку в фильтре
    private func getCarModel() -> String {
        return carBrandTextField.text ?? ""
    
    }
    
    // получаем цвет в фильтре
    private func getCarColor() -> String {
        return carColorTextField.text ?? ""

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
        var helper: Int = 0
        for car in listOfCars {
            guard car.carModel == filteredCar.carModel else {continue}
            if helper < 1 { helper = 1 }
            guard car.carColor == filteredCar.carColor else {continue}
            if helper < 2 { helper = 2 }
            guard car.carEngine == filteredCar.carEngine else {continue}
            if helper < 3 { helper = 3 }
            guard car.yearOfCarManufacture <= filteredCar.yearOfCarManufacture else {continue}
            if helper < 4 { helper = 4 }
            guard car.carPrice <= filteredCar.carPrice else {continue}
            
            foundedCar = car
        }
        changeFilter = helper
        
    }
    
    private func helperInFilter(changeFilter: Int) -> String {
        switch changeFilter {
        case 0:
            return "Модель"
        case 1:
            return "Цвет"
        case 2:
            return "Двигатель"
        case 3:
            return "Год выпуска"
        default:
            return "Цену"
        }
    }
    
    // вызов алертконтроллер по результатам фильтра
    private func alertFilterCar(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okButton = UIAlertAction(
            title: "OK",
            style: .default
        )
        alertController.addAction(okButton)
        present(alertController, animated: true)
        
    }
    
    private func showAlert(filter: String) {
        if foundedCar != nil {

            alertFilterCar(title: "Отлично!", message: "По вашему запросу авто найдено")
            prepareButtonToSegue()
        } else {
            alertFilterCar(title: "Ошибка", message: "Авто не найдено. Попробуйте изменить \(filter)")
        }
    }
    private func prepareButtonToSegue() {
            applyFilterButton.isHidden = true
            showResultButton.isHidden = false
        }
    }
    


