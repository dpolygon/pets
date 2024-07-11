//
//  PetsContainer.swift
//  pets
//
//  Created by Daniel Gonzalez on 7/9/24.
//

import Foundation
import SwiftData

actor PetsContainer {
    
    @MainActor
    static func create() -> ModelContainer {
        let previewContainer: ModelContainer = {
            do {
                let schema = Schema([Pet.self])
                print("schema complete")
                let configuration = ModelConfiguration()
                print("config complete")
                let container = try ModelContainer(for: schema, configurations: configuration)
                print("container generated")
                
                // Create a fetch descriptor to fetch all Pet entities
                let fetchDescriptor = FetchDescriptor<Pet>()
                // Fetch all existing pets and delete them from the context
                let existingPets = try container.mainContext.fetch(fetchDescriptor)
                for pet in existingPets {
                    container.mainContext.delete(pet)
                }
                print("container cleared")
                
                let pets = [
                    Pet(name: "Diva", kind: "Dog", trick: "Begging", picture: "diva"),
                    Pet(name: "Cosmo", kind: "Dog", trick: "Crying", picture: "cosmo"),
                    Pet(name: "Lizzy", kind: "Lizard", trick: "Sun bathing", picture: "liz"),
                    Pet(name: "Turt", kind: "Turtle", trick: "Standing still", picture: "turt"),
                    Pet(name: "Mountain Dew", kind: "Bird", trick: "Singing his heart out", picture: "bird"),
                    Pet(name: "kitty kitty", kind: "Cat", trick: "Disappearing", picture: "cat")
                ]
                
                for item in pets {
                    container.mainContext.insert(item)
                }
                print("default pets inserted")
                
                return container
            } catch {
                fatalError("Failed to create container")
            }
        }()
        
        return previewContainer
    }
}
