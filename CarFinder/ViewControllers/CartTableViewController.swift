//
//  CartTVC.swift
//  CarFinder
//
//  Created by Kalabishka Ivan on 19.04.2021.
//

import UIKit

class CartTableViewController: UITableViewController {

    //MARK: - Public Properties
    var delegate: ReserveVCDelegate!
    
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
        DataManager.shared.reservedCarsInCart.count
    }
    
    // настраиваем ячейку
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // создаем экземпляр ячейки нашего кастомного класса
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        
        //определяем индекс элемента массива со списком заказанных автомобилей
        let car = DataManager.shared.reservedCarsInCart[indexPath.row]
        
        // вызываем функцию из класса ячейки с типом данных нашего элемента car
        cell.cellSetup(object: car)
            
        return cell
    }
    
    
    //настраиваем функцию удаления данных из ячейки таблици и из массива с заказанными автомобилями при нажатии на Delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        DataManager.shared.reservedCarsInCart.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
    
    
    
    
    
    
}
