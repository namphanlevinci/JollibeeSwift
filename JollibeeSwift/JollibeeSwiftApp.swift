//
//  JollibeeSwiftApp.swift
//  JollibeeSwift
//
//  Created by Phan Nhat Nam on 18/12/2022.
//

import SwiftUI

@main
struct JollibeeSwiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
