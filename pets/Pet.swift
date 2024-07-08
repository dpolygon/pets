//
//  Pets.swift
//  pets
//
//  Created by Daniel Gonzalez on 7/7/24.
//

import Foundation
import SwiftUI

@Observable
class Pet: Identifiable, Hashable {
    static func == (lhs: Pet, rhs: Pet) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var name: String
    var kind: String
    var trick: String
    var picture: String
    var id = UUID()
    var color = random_color()
    var hasAward: Bool = false
    
    init(name: String, kind: String, trick: String, picture: String) {
        self.name = name
        self.kind = kind
        self.trick = trick
        self.picture = picture
    }
    
    func Award() {
        hasAward = !hasAward
    }
}


func random_color() -> Color {
    let colors: [Color] = [.red, .blue, .green, .yellow, .orange, .gray, .cyan]
    let randIndex = Int(arc4random_uniform(UInt32(colors.count)))
    
    return colors[randIndex]
}
