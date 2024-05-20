//
//  AlongApp.swift
//  Along
//
//  Created by Alfonso Tarallo on 29/10/23.
//

import SwiftUI
import SwiftData

@main
struct AlongApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Team.self])
        }
    }
}
