//
//  BehaviorsApp.swift
//  Behaviors
//
//  Created by Jeffrey Yao on 2/10/2023.
//

import SwiftUI

@main
struct BehaviorsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
