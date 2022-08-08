//
//  DataController.swift
//  MassNotes
//
//  Created by Sherif Yasser on 31.07.22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "MassNotes")
    
    init(){
            container.loadPersistentStores { description, error in
                if let error = error {
                    print("Core Data Failed to load \(error.localizedDescription)")
                }
            
        }
    }
}

class AppStateHandler {
    func save(context: NSManagedObjectContext) {
        do{
            try context.save()
            print("Data Saved")
        } catch {
            print("Data failed to save")
        }
    }
    
    func addAppState(isIntro: Bool,context: NSManagedObjectContext){
        let appState = AppState(context: context)
        appState.isIntro = isIntro
        save(context: context)
    }
    
    func editAppState(appState:AppState, isIntro: Bool,context: NSManagedObjectContext){
        appState.isIntro = isIntro
        save(context: context)
    }
}
