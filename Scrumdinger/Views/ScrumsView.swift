//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Jessi Zimmerman on 10/31/22.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums : [DailyScrum]
    @State private var isPresentingNewScrumView = false

    
    var body: some View {
        NavigationView{
            List($scrums){ $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
                
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
            .sheet(isPresented: $isPresentingNewScrumView) {
                NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ScrumsView(scrums:.constant(DailyScrum.sampleData))
        }
    }
}
