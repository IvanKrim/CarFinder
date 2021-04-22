//
//  FilterViewController.swift
//  CarFinder
//
//  Created by Юрий Чекалюк on 17.04.2021.
//

import UIKit

class FilterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: - Public Properties


    
    //MARK: - Private properties
    
    private let carList = DataManager.shared.carModels

    
    //MARK: - IB Outlets
    @IBOutlet weak var carBrandTextField: UITextField!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        
        let picker = UIPickerView()
        
        carBrandTextField.inputView = picker
        
        picker.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
        {
            view.endEditing(true) 
        }
    
    //MARK: - Public Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return carList.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     return carList[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        carBrandTextField.text = carList[row]
    }
    
    //MARK: - Private Methods
    
    private func getCarModel() -> String {
        return carBrandTextField.text ?? ""
    }
    
//    private func getFilteredCar() -> Car {
//        return Car(
//            carModel: getCarModel(),
//            carColor: <#T##String#>,
//            carEngine: <#T##String#>,
//            yearOfCarManufacture: <#T##String#>,
//            carPrice: "добавить цену в сториборд")
//    }
}
