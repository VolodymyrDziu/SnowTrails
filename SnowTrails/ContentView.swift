//
//  ContentView.swift
//  SnowTrails
//
//  Created by Volodymyr Dziubenko on 15.04.2026.
//

import SwiftUI

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
   
    @State private var selectedResort: Resort?
    @State private var searchText = ""
    @State private var favotites = Favorites()
 
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            resorts
        } else {
            resorts.filter {$0.name.localizedStandardContains(searchText)}
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(filteredResorts, selection: $selectedResort) { resort in
                NavigationLink(value: resort) {
                    HStack { 
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                .rect(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        if favotites.contains(resort){
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("Favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("SnowTrails")
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .automatic),
                prompt: "Search for a resorts"
            )
        } detail: {
            if let selectedResort {
                ResortView(resort: selectedResort)
            } else {
                WelcomeView()
            }
        }
        .environment(favotites)
    }
}




#Preview {
    ContentView()
}
