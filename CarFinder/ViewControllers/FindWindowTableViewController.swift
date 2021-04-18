//
//  FindWindowTableViewController.swift
//  CarFinder
//
//  Created by Юрий Чекалюк on 17.04.2021.
//

import UIKit

class FindWindowTableViewController: UITableViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var carNameYearLabel: UILabel!
    @IBOutlet weak var carColorLabel: UILabel!
    @IBOutlet weak var carPriceLabel: UILabel!
    

    //MARK: - Public Properties
    
    var listOfCars: [Car]!

    //MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7496516109, green: 0.8531972766, blue: 0.9390820265, alpha: 1)
        
        print(listOfCars.count)
        
        
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
        
        cell.nameYearLabel.text = car.fullVehicleInformation
        cell.colorLabel.text = car.carColor
        cell.priceLabel.text = car.carPrice
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
