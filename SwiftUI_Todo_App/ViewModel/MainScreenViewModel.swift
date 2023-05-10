//
//  MainScreenViewModel.swift
//  SwiftUI_Todo_App
//
//  Created by Ahmet Akın Özbulut on 8.05.2023.
//

import Foundation
import CoreData

class MainScreenViewModel : ObservableObject {
    @Published var todo = [Todo]()
    let context = persistentContainer.viewContext
    
    func TasklariYükle(){
        do{
            let liste = try context.fetch(Todo.fetchRequest())
            todo = liste
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func Sil(todo:Todo) {
        context.delete(todo)
        saveContext()
        TasklariYükle()
        
    }
    
}

