//
//  StudyingAppApp.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import SwiftUI

@main
struct StudyingAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
