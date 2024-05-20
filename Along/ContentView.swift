//
//  ContentView.swift
//  Along
//
//  Created by Alfonso Tarallo on 29/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @Query var teams: [Team] = []
    var body: some View {
        HomeView()
    }
}

#Preview {
    ContentView()
}
