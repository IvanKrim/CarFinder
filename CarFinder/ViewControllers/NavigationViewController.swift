//
//  NavigationViewController.swift
//  CarFinder
//
//  Created by Юрий Чекалюк on 18.04.2021.
//

import UIKit

class NavigationViewController: UINavigationController {

    //MARK: - Public Properties
    var listOfCars: [Car]!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // здесь исправил название переменной по короткому названию viewcontroller
        
//        guard let findWindowTableVC = segue.destination as? FindWindowTableViewController else { return }
//
//        findWindowTableVC.listOfCars = listOfCars
        
        
    }
    
}
