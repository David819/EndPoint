//
//  EndPointApp.swift
//  EndPoint
//
//  Created by David on 12/25/20.
//

import SwiftUI

@main
struct EndPointApp: App {
    let persistentController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistentController.container.viewContext)
        }
    }
}
