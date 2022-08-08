//
//  MassNotesApp.swift
//  MassNotes
//
//  Created by Sherif Yasser on 31.07.22.
//

import SwiftUI

@main
struct MassNotesApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            Launch()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
