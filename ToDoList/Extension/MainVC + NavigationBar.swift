//
//  MainVC + NavigationBar.swift
//  ToDoList
//
//  Created by Никита Бурин on 12.01.2023.
//

import UIKit

extension MainViewController {
    
    func initialize(){
        navigationItem.rightBarButtonItems = setAddButton()
    }
    func setAddButton() -> [UIBarButtonItem] {
        let addBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(saveTask))
        return [addBarButton]
    }
}
