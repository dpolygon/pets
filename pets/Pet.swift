//
//  Pets.swift
//  pets
//
//  Created by Daniel Gonzalez on 7/7/24.
//

import Foundation
import UIKit
import SwiftUI
import SwiftData

@Model
class Pet: Identifiable {
    var name: String
    var kind: String
    var trick: String
    var picture: String
    var rating: Int
    var id: UUID
    var hasAward: Bool
    
    init(name: String, kind: String, trick: String, picture: String) {
        self.name = name
        self.kind = kind
        self.trick = trick
        self.picture = picture
        self.rating = Int(arc4random_uniform(11))
        self.id = UUID()
        self.hasAward = false
    }
    
    func Award() {
        hasAward = !hasAward
    }
}

struct CodableColor: Codable {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    var alpha: CGFloat
}

func randomColor() -> CodableColor {
    let colors: [UIColor] = [.systemBlue, .systemRed, .systemGreen]
    let colorIndex = arc4random_uniform(UInt32(colors.count))
    let color = colors[Int(colorIndex)]
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
    return CodableColor(red: red, green: green, blue: blue, alpha: alpha)
}

func getColor(color: CodableColor) -> Color {
    return Color(red: color.red, green: color.green, blue: color.blue, opacity: color.alpha)
}


