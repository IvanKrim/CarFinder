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
    var carEngine: String
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
            
            var car = Car(
                carModel: DataManager.shared.carModels[index],
                carColor: DataManager.shared.carColors[index],
                carEngine: "",
                yearOfCarManufacture: DataManager.shared.yearsOfCarManufacture[index],
                carPrice: DataManager.shared.carPrices[index]
            )
            
            // выбираем тип двигателя от марки авто
            switch car.carModel {
            case "Audi A4", "Mazda 6", "Mazda CX-9", "Ford Mustang":
                car.carEngine = "Бензин"
            case "BMW 3", "Mercedes-Benz E-class":
                car.carEngine = "Дизель"
            default:
                car.carEngine = "Электро"
            }
            
            listOfCars.append(car)
        }
        return listOfCars
    }
}


//модель для корзины
struct Cart {
    
    let carModel: String
    let carColor: String
    let carPrice: String
    
}
