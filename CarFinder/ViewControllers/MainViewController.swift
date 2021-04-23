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
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        needAutoButton.layer.cornerRadius = 10
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // передаю массив через navigation controller на findwindow controller
        guard let navigationVC = segue.destination as? NavigationViewController else { return }
        let findWindowTableVC = navigationVC.topViewController as! FindWindowTableViewController
        
        findWindowTableVC.listOfCars = listOfCars
        
    }
}

