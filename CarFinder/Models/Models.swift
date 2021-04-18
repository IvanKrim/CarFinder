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
    let customerName: String
    let customerPhoneNumber: String
    
    //MARK: Данные в методе пока захардхожены, далее зададим из ДатаМенеджера.
    static func getCarInfo() -> Car {
        Car(
            carModel: "Модель",
            carColor: "Цвет",
            carEngine: "Двигатель",
            yearOfCarManufacture: "2000",
            carPrice: "1890000",
            customerName: "Имя",
            customerPhoneNumber: "Номер телефона"
        )
    }
}

