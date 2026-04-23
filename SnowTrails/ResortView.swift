//
//  ResortView.swift
//  SnowTrails
//
//  Created by Volodymyr Dziubenko on 21.04.2026.
//

import SwiftUI

 struct ResortView: View {
    let resort: Resort
     
     @Environment(Favorites.self) var favorites
     @State private var selectedFacility: Facility?
     @State private var showingFacility = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                Text(resort.country)
                    .font(.title3)
                    .foregroundStyle(.secondary)
                HStack {
                    ResortDetailView(resort: resort)
                    DetailSciView(resort: resort)
                }
                .padding(.vertical)
                .background(.primary.opacity(0.1))
               Group {
                    
                    Text(resort.description)
                       .padding(.vertical)
                   if !resort.facilities.isEmpty {
                       VStack(alignment: .leading, spacing: 8) {
                           Text("Facilities")
                               .font(.headline)

                           HStack {
                              
                               ForEach(resort.facilityTypes) { facility in
                                   Button {
                                       selectedFacility = facility
                                       showingFacility = true
                                   }label: {
                                       facility.icon
                                           .font(.title)
                                   }
                                   
                               }
                           }
                           .padding(.vertical)
                       }
                   }

                }
            }
            .padding(24)
            Button(favorites.contains(resort) ? "Remove favorites" : "Add favorites"){
                if favorites.contains(resort){
                    favorites.remove(resort)
                } else {
                    favorites.add(resort)
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("\(resort.name)")
        .alert(selectedFacility?.name ?? "More information", isPresented: $showingFacility, presenting: selectedFacility) { _ in
        } message: { facility in
            Text(facility.description)
        }
    }
}


#Preview {
    ResortView(resort: .example)
        .environment(Favorites())
}
