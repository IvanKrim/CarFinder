//
//  ViewController.swift
//  CarFinder
//
//  Created by Kalabishka Ivan on 16.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var needAutoButton: UIButton!
    
    //MARK: - Private Properties
    private let listOfCars = Car.getCarInfo()
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        needAutoButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // передаю массив через navigation controller на findwindow controller
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        let findWindowTableVC = navigationVC.topViewController as! FindWindowTableViewController
        findWindowTableVC.listOfCars = listOfCars
    }
}

