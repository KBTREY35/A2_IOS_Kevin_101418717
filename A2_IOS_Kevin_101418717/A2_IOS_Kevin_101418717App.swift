//
//  A2_IOS_Kevin_101418717App.swift
//  A2_IOS_Kevin_101418717
//
//  Created by kevin bhangu on 2025-03-28.
//

import SwiftUI

@main
struct A2_IOS_Kevin_101418717App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}



