//
//  CartTVC.swift
//  CarFinder
//
//  Created by Kalabishka Ivan on 19.04.2021.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    
    
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.07241869718, green: 0.2375045419, blue: 0.3554243445, alpha: 1)
        tableView.separatorColor = #colorLiteral(red: 0, green: 0.7984993458, blue: 0.2820848227, alpha: 1)
        //добавляем кнопку редактирования табличного содержимого и настраиваем его внешний вид (метод из коробки)
        navigationItem.rightBarButtonItem = editButtonItem
        //функция смены заголовка, если в корзине нет заказов (вынесена ниже в экстеншен)
        changeTitle()
        
        
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
        changeTitle()
    }
    
}


//меняем заголовок в корзине, если в ней нет заказов
extension CartTableViewController {
    func changeTitle() {
        if DataManager.shared.reservedCarsInCart.count == 1 {
            title = "Ваш заказ"
        } else if DataManager.shared.reservedCarsInCart.count > 1 {
            title = "Ваши заказы"
        } else {
            title = "Заказов нет"
            
        }
    }
}
