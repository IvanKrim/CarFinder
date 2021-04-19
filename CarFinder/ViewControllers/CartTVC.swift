//
//  CartTVC.swift
//  CarFinder
//
//  Created by Kalabishka Ivan on 19.04.2021.
//

import UIKit

class CartTVC: UITableViewController {

    let carsInCart = [
        Cart(carModel: "🚘", carColor: "RED"),
        Cart(carModel: "🚖", carColor: "YELLOW")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Корзина"
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carsInCart.count
    }
    
    
    // настраиваем ячейку
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // создаем экземпляр ячейки нашего кастомного класса
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        
        
        let car = carsInCart[indexPath.row]
        
        cell.nameYearLabel.text = car.carModel
        cell.carColorLabel.text = car.carColor

        
        return cell
    }
    
}
