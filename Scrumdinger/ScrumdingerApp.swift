//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Nicola Kaleta on 31/01/2024.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums)
                .task {
                    do {
                        try await store.load()
                    }
                    catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}
