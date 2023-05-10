//
//  SaveScreenViewModel.swift
//  SwiftUI_Todo_App
//
//  Created by Ahmet Akın Özbulut on 8.05.2023.
//

import Foundation
import CoreData

class SaveScreenViewModel : ObservableObject {
    let context = persistentContainer.viewContext
    
    func Save(task:String) {
        let todo = Todo(context: context)
        todo.task = task
        saveContext()
        
    }
}


