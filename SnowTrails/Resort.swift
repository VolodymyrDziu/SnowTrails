//
//  Resort.swift
//  SnowTrails
//
//  Created by Volodymyr Dziubenko on 15.04.2026.
//

import Foundation

struct Resort: Codable, Hashable, Identifiable {
    var id: String
    var name: String
    var country: String
    var description: String
    var imageCredit: String
    var price: Int
    var size: Int
    var snowDepth: Int
    var elevation: Int
    var runs: Int
    var facilities: [String]
    
    @MainActor
    var facilityTypes: [Facility] {
        facilities.map(Facility.init)
    }
    
    
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResorts[0]
}
