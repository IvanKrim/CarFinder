//
//  CartTVC.swift
//  CarFinder
//
//  Created by Kalabishka Ivan on 19.04.2021.
//

import UIKit

class CartTVC: UITableViewController {

//тестовый массив - вместо него надо использовать массив, создаваемый функцией кнопки "Сделать заказ"
    //массив надо записывать в датаменеджер в var(чтобы можно было редактировать - удалять из корзины)
    
    let carsInCart = [
        Cart(carModel: "🚘", carColor: "RED", carPrice: "2 200 000 🤑"),
        Cart(carModel: "🚖", carColor: "YELLOW", carPrice: "2 200 000 🤑")
    ]
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ваш заказ"
    }

    // MARK: - Table view data source
    //настраиваем количество ячеек в таблице
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carsInCart.count
    }
    
    // настраиваем ячейку
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // создаем экземпляр ячейки нашего кастомного класса
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        
        //определяем индекс элемента массива со списком заказанных автомобилей
        let car = carsInCart[indexPath.row]
        
        //расставляем свойства каждого конкретного автомобиля из списка по лэйблам
        cell.nameYearLabel.text = car.carModel
        cell.carColorLabel.text = car.carColor
        cell.carPriceLabel.text = car.carPrice
        
        return cell
    }
}
