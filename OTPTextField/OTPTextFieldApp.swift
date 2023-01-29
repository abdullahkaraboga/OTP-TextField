//
//  OTPTextFieldApp.swift
//  OTPTextField
//
//  Created by Abdullah Karaboğa on 29.01.2023.
//

import SwiftUI

@main
struct OTPTextFieldApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
