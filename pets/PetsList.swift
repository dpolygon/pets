//
//  PetsList.swift
//  pets
//
//  Created by Daniel Gonzalez on 7/7/24.
//

import SwiftUI
import SwiftData


struct PetsList: View {
    @Environment(\.modelContext) private var context
    @Query private var pets: [Pet]

    var body: some View {
        NavigationStack {
            List {
                Section("Coolest Pets") {
                    ForEach(pets) { pet in
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
    PetsList().modelContainer(PetsContainer.create())
}
