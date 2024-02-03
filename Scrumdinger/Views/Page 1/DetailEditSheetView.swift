//
//  DetailEditSheetView.swift
//  Scrumdinger
//
//  Created by Nicola Kaleta on 03/02/2024.
//

import SwiftUI

struct DetailEditSheetView: View {
    @Binding var scrum: DailyScrum
    @Binding var isPresentedEditView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $scrum)
                .navigationTitle(scrum.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentedEditView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPresentedEditView = false
                        }
                    }
                }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
