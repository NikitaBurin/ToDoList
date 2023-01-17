//
//  MainViewController.swift
//  ToDoList
//
//  Created by Никита Бурин on 09.01.2023.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        
    }
}



