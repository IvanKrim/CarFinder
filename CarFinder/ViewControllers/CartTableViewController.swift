//
//  CartTVC.swift
//  CarFinder
//
//  Created by Kalabishka Ivan on 19.04.2021.
//

import UIKit

class CartTableViewController: UITableViewController {

    
    
    
//тестовый массив - вместо него надо использовать массив, создаваемый функцией кнопки "Сделать заказ"
    //массив надо записывать в датаменеджер в var(чтобы можно было редактировать - удалять из корзины)
    
    var carsInCart = [
        Cart(carModel: "🚘", carColor: "RED", carPrice: "2 200 000 🤑"),
        Cart(carModel: "🚖", carColor: "YELLOW", carPrice: "2 200 000 🤑")
    ]
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //добавляем кнопку редактирования табличного содержимого и настраиваем его внешний вид (метод из коробки)
        navigationItem.rightBarButtonItem = editButtonItem
        
        title = "Ваш заказ"
    }
    
    
    @IBAction func backBarButtonItemTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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
        
        // вызываем функцию из класса ячейки с типом данных нашего элемента car
        cell.cellSetup(object: car)
            
        return cell
    }
    
    
    //настраиваем функцию удаления данных из ячейки таблици и из массива с заказанными автомобилями при нажатии на Delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        carsInCart.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
    
    
    
    
    
    
}
