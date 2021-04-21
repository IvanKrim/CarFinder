//
//  FindWindowTableViewController.swift
//  CarFinder
//
//  Created by Юрий Чекалюк on 17.04.2021.
//

import UIKit

class FindWindowTableViewController: UITableViewController {
    
    //MARK: IB Outlets

    
    //MARK: - Public Properties
    
    var listOfCars: [Car]!

    //MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7496516109, green: 0.8531972766, blue: 0.9390820265, alpha: 1)
        
        // количество предложений в navigation title
        navigationItem.title = "\(listOfCars.count) предложений"
         
    }

    // MARK: - Table view data source
    // задаем количество строк в списке по количеству элементов в массиве
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfCars.count
    }

    // настраиваем ячейку
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // создаем экземпляр ячейки нашего кастомного класса
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarInfoTableViewCell
        
        // получаем из массива нужный элемент для каждой ячейки по indexPath(по номеру) для каждой строки
        let car = listOfCars[indexPath.row]
        
        // вызываем функцию из класса ячейки с типом данных нашего элемента car
        cell.cellSetup(object: car)
        
        return cell
    }
    
    // MARK: - Navigation
    
    // переход с передачей данных из строки
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // извлекаем опциональное значение индекса и присваиваем переменной
        if let indexPath = tableView.indexPathForSelectedRow {
            //кастим контроллер
            let detailVC = segue.destination as! DetailViewController
            //передаем значение из массива по индексу строки в переменную 
            detailVC.car = listOfCars[indexPath.row]
        }
        
        

        
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        }

}
