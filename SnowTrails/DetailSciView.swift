//
//  DetailView.swift
//  SnowTrails
//
//  Created by Volodymyr Dziubenko on 21.04.2026.
//

import SwiftUI

 struct DetailSciView: View {
    let resort: Resort
    
    var body: some View {
        Group {
            VStack {
                Text("Elevation")
                    .font(.caption.bold())
                Text("\(resort.elevation)m")
                    .font(.title3)
                 
            }
            VStack {
                Text("Snow")
                    .font(.caption.bold())
                Text("\(resort.snowDepth)cm")
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    DetailSciView(resort: .example)
}
