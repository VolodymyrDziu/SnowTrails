//
//  WelcomeView.swift
//  SnowTrails
//
//  Created by Volodymyr Dziubenko on 20.04.2026.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowTrails")
                .font(.largeTitle)
            Text("Select a resort from the sidebar to see its details.")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
