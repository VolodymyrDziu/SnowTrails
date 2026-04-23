//
//  ResortDetailView.swift
//  SnowTrails
//
//  Created by Volodymyr Dziubenko on 21.04.2026.
//

import SwiftUI

struct ResortDetailView: View {
    var resort: Resort
    var size: String {
        switch resort.size {
        case 1: "Small"
        case 2: "Medium"
        default: "Large"
        }
    }
    
    var price: String {
        String(repeating: "💵", count: resort.price)
    }
    
    var body: some View {
        Group {
            VStack {
                Text("Size")
                    .font(.caption.bold())
                Text(size)
                    .font(.title3)
            }
            VStack {
                Text("Price")
                    .font(.caption.bold())
                Text(price)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ResortDetailView(resort: .example)
}
