//
//  Models.swift
//  CarFinder
//
//  Created by Юрий Чекалюк on 17.04.2021.
//

struct Car {
    
    // основные свойства
    let carModel: String
    let carColor: String
    let carEngine: String
    let yearOfCarManufacture: String
    let carPrice: String
    
    // полное название идентично названию изображения
    var fullVehicleInformation: String {
        "\(carModel), \(yearOfCarManufacture)"
    }
    
    // инициализатор модели - возвращает массив с элементами типа Car
    static func getCarInfo() -> [Car] {
        
        var listOfCars: [Car] = []
        
        // количество всех свойств должно быть равным количеству марок авто,
        // иначе инициализатор надо переделать
        for index in 0..<DataManager.shared.carModels.count {
            
            let car = Car(
                carModel: DataManager.shared.carModels[index],
                carColor: DataManager.shared.carColors[index],
                carEngine: DataManager.shared.carEngines.randomElement() ?? "",
                yearOfCarManufacture: DataManager.shared.yearsOfCarManufacture[index],
                carPrice: DataManager.shared.carPrices[index]
            )
            
            listOfCars.append(car)
        }
        return listOfCars
    }
}

