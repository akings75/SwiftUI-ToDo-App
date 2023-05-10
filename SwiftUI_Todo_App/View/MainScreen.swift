//
//  ContentView.swift
//  SwiftUI_Todo_App
//
//  Created by Ahmet Akın Özbulut on 8.05.2023.
//

import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var viewModel : MainScreenViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.todo) { todo in
                    NavigationLink(destination: DetailScreen(todom: todo, todo: $viewModel.todo)){
                        TodoItem(todo: todo)
                    }
                }
                .onDelete(perform: deleteItem)
                 .onMove(perform: moveItem)
            
            }.navigationTitle("To Do List")
                .navigationBarItems(leading:EditButton(),trailing:NavigationLink(destination: SaveScreen()){
                    Image(systemName: "plus")
                } ).onAppear {
                
                    viewModel.TasklariYükle()
                }
            
        }
        
    }
    
    func deleteItem(at offsets:IndexSet){
        let todo = viewModel.todo[offsets.first!]
        viewModel.Sil(todo: todo)
    }
    func moveItem(from: IndexSet, to: Int){
        viewModel.todo.move(fromOffsets: from, toOffset: to)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen().environmentObject(MainScreenViewModel())
    }
}
