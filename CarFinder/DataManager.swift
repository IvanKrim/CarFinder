//
//  DataManager.swift
//  CarFinder
//
//  Created by Кирилл Нескоромный on 17.04.2021.
//

class CarInfo {
    
    static let shared = CarInfo()
    
    let carModels = [
        "Audi", "BMW", "Cadillac", "Chevrolet", "Chrysler", "Citroen",
        "Dodge", "Fiat", "Ford", "Honda", "Hyundai", "Infiniti", "Jaguar",
        "Jeep", "Kia", "Land Rover", "Lexus", "Mazda", "Mercedes-Benz",
        "MINI", "Mitsubishi", "Nissan", "Opel", "Porsche", "Renault", "Saab",
        "Skoda", "Subaru", "Suzuki", "Toyota", "Volkswagen", "Volvo"
    ]
    
    let carColors = [
        "черный", "голубой", "коричневый",
        "золотой", "серый", "зеленый", "синий", "фиолетовый",
        "красный", "серебристый", "белый", "желтый", "оранжевый"
    
    ]
    
    let carEngins = [
        "бензин", "дизель", "газ", "электро"
    ]
    
    let yearsOfCarManufacture = [
        "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008",
        "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
        "2017", "2018", "2019", "2020", "2021"
    ]
    
    private init() {}
}
