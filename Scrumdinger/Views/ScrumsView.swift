//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Nicola Kaleta on 01/02/2024.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            List(scrums) { scrum in
                NavigationLink (destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                    
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                        .font(.subheadline)
                        .padding(3)
                        .fontWeight(.bold)
                        .background(Color.accentColor.opacity(0.2)).cornerRadius(35)
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: DailyScrum.sampleData)
}
