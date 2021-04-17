//
//  ViewController.swift
//  CarFinder
//
//  Created by Kalabishka Ivan on 16.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Private Properties
    private let car = Car.getCarInfo()
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9538531899, green: 0.9695010781, blue: 0.9060884118, alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tableViewController = segue.destination as? FindWindowTableViewController else { return }
        tableViewController.car = car
    }
    
}

