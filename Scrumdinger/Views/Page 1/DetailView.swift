//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Nicola Kaleta on 01/02/2024.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var isPresentedEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting info")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)){
                    
                    
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length",  systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                    
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            Section(header: Text("History")) {
                if scrum.history.isEmpty {
                    Label("No meeting yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) { history in
                    HStack {
                        Image(systemName: "calendar")
                        Text(history.date, style: .date)
                    }
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentedEditView = true
            }
        }
        .sheet(isPresented: $isPresentedEditView) {
            DetailEditSheetView(scrum: $scrum, isPresentedEditView: $isPresentedEditView)
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
