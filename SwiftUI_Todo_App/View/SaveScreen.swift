//
//  SaveScreen.swift
//  SwiftUI_Todo_App
//
//  Created by Ahmet Akın Özbulut on 8.05.2023.
//

import SwiftUI

struct SaveScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State var text = ""
    @ObservedObject var viewModell = SaveScreenViewModel()
    var body: some View {
        
        VStack {
            TextField("Görev giriniz",text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(.bar.shadow(.drop(radius: 10)))
                .padding()
            
            Button("Save") {
                viewModell.Save(task: text)
                presentationMode.wrappedValue.dismiss()
                
            
            }.foregroundColor(.white)
             .frame(width: 250,height: 50)
             .background(.blue)
             .cornerRadius(10)
        }.navigationTitle("Task Save")
    }
}

struct SaveScreen_Previews: PreviewProvider {
    static var previews: some View {
        SaveScreen()
    }
}
