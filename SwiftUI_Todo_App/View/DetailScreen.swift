//
//  DetailScreen.swift
//  SwiftUI_Todo_App
//
//  Created by Ahmet Akın Özbulut on 8.05.2023.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var text = ""
    var viewModell = DetailScreenViewModel()
    var todom = Todo()
    @Binding var todo:[Todo]
    var body: some View {
        VStack {
            TextField("Görev giriniz",text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(.bar.shadow(.drop(radius: 10)))
                .padding()
            
            Button("Update") {
                viewModell.Update(todo: todom, task: text)
                todo.removeAll()
                presentationMode.wrappedValue.dismiss()
                            
            }.foregroundColor(.white)
             .frame(width: 250,height: 50)
             .background(.blue)
             .cornerRadius(10)
        }.navigationTitle("Task Save")
            .onAppear {
                text = todom.task!
            }
    }
}

/*
 struct DetailScreen_Previews: PreviewProvider {
 static var previews: some View {
 DetailScreen()
 }
 }
 */
