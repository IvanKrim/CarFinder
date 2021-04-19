//
//  ServiceDataManager.swift
//  CarFinder
//
//  Created by Kalabishka Ivan on 17.04.2021.
//



class DataManager {
    
    static let shared = DataManager()
    
    let carModels = [
        "Audi A4", "BMW 3", "Mercedes-Benz E-class",
        "Mazda 6", "Mazda CX-9", "Ford Mustang",
        "Tesla Model S"
    ]
    
    let carPrices = [
        "1 500 000 руб.", "1 650 000 руб.", "1 850 000 руб.",
        "2 000 000 руб.", "3 050 000 руб.", "2 100 000 руб.",
        "7 900 000 руб"
    ]
    
    let yearsOfCarManufacture = [
        "2020", "2020", "2019",
        "2020","2021", "2020",
        "2021"
    ]
    
    let carColors = [
        "Синий", "Белый", "Белый",
        "Красный", "Белый", "Синий",
        "Красный"
    ]
    
    let carEngines = [
        "Бензин", "Дизель", "Электро"
    ]
    
    private init() {}
}


