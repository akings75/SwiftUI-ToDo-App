//
//  TodoItem.swift
//  SwiftUI_Todo_App
//
//  Created by Ahmet Akın Özbulut on 8.05.2023.
//

import SwiftUI

struct TodoItem: View {
    var todo : Todo
    
    var body: some View {
        
        HStack {
            Image(systemName: todo.isSelected ? "checkmark.circle" : "circle")
                .foregroundColor(todo.isSelected ? .green : .red)
              
            Text(todo.task!).font(.system(size: 25))
        }
    }
}


