//
//  PetsList.swift
//  pets
//
//  Created by Daniel Gonzalez on 7/7/24.
//

import SwiftUI


struct PetsList: View {
    var Pets: [Pet] = [
        Pet(name: "Diva", kind: "Dog", trick: "Begging", picture: "diva"),
        Pet(name: "Cosmo", kind: "Dog", trick: "Crying", picture: "cosmo"),
        Pet(name: "Lizzy", kind: "Lizard", trick: "Sun bathing", picture: "liz"),
        Pet(name: "Turt", kind: "Turtle", trick: "Standing still", picture: "turt"),
        Pet(name: "Mountain Dew", kind: "Bird", trick: "Singing his heart out", picture: "bird"),
        Pet(name: "kitty kitty", kind: "Cat", trick: "Disappearing", picture: "cat")
    ]

    var body: some View {
        NavigationStack {
            List {
                Section("Coolest Pets") {
                    ForEach(Pets) { pet in
                        NavigationLink(value: pet) {
                            RowView(pet: pet)
                                .swipeActions(edge: .leading) {
                                    Button("Award", systemImage: "trophy") {
                                        pet.Award()
                                    }.tint(.yellow)
                                }
                        }
                    }
                }
            }
                .navigationTitle("Pets")
                .navigationDestination(for: Pet.self) { pet in
                    PetsDetailView(pet: pet)
                }
        }
    }
}

#Preview {
    PetsList()
}
