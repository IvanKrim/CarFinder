//
//  Models.swift
//  CarFinder
//
//  Created by Юрий Чекалюк on 17.04.2021.
//

struct Car {
    //MARK: Марка, цвет, объем двигателя, год выпуска автомобиля
    let carModel: String
    let carColor: String
    let carEngine: String
    let yearOfCarManufacture: String
    let carPrice: String
    
    //MARK: Геттер для заголовка над ценой автомобиля и для вызова изображения( для этого надо назвать фото так же как и в DataManager
    var fullVehicleInformation: String {
        "\(carModel), \(yearOfCarManufacture)"
    }
    
    //MARK: Данные заказчика(имя и номер телефона)
    // пока здесь закоментил, данных заказчика, по-моему, не должно быть в этой модели
//    let customerName: String
//    let customerPhoneNumber: String
    
    // инициализатор модели - возвращает массив с элементами типа Car
    static func getCarInfo() -> [Car] {
        
        var listOfCars: [Car] = []
        
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

