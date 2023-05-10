//
//  SwiftUI_Todo_AppApp.swift
//  SwiftUI_Todo_App
//
//  Created by Ahmet Akın Özbulut on 8.05.2023.
//

import SwiftUI
import CoreData

@main
struct SwiftUI_Todo_AppApp: App {
    @StateObject var mainscreenviewmodel = MainScreenViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainScreen()
            }.environmentObject(mainscreenviewmodel)
        }
    }
}

var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Model")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()

func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}

