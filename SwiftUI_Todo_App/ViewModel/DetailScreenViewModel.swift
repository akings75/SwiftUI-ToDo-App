//
//  DetailScreenViewModel.swift
//  SwiftUI_Todo_App
//
//  Created by Ahmet Akın Özbulut on 8.05.2023.
//

import Foundation
import CoreData

class DetailScreenViewModel {
    func Update(todo:Todo,task:String) {
        todo.task = task
        todo.isSelected.toggle()
        saveContext()
    }
}
