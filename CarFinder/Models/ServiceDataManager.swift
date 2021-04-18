//
//  ServiceDataManager.swift
//  CarFinder
//
//  Created by Kalabishka Ivan on 17.04.2021.
//

class DataManager {
    
    static let shared = DataManager()
    
    // исправил названия массивов во множественном числе
    let carModels = [
    "Audi A4", "BMW 3", "Mercedes-Benz E-class", "Mazda 6", "Ford Mustang"
    ]
    // добавил массив с ценами
    let carPrices = [
        "1500000", "1650000", "1850000", "2000000", "2100000"
    ]
    
    let yearsOfCarManufacture = [
        "2020", "2020", "2019", "2020", "2020"
    ]
    
    let carColors = [
    "Синий", "Белый", "Белый", "Красный", "Синий"
    ]
    
    let carEngines = [
    "Бензин", "Дизель"
    ]
    
    private init() {}
}
