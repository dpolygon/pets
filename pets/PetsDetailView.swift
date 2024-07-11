//
//  PetsDetailView.swift
//  pets
//
//  Created by Daniel Gonzalez on 7/8/24.
//

import SwiftUI

struct PetsDetailView: View {
    var pet: Pet
    
    var body: some View {
        VStack {
            profileImage
            Text(pet.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text(pet.trick)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        Spacer()
        RatingView(pet: pet)
        Spacer()
    }
    
    private var profileImage: some View {
        Image(pet.picture)
            .resizable()
            .scaledToFill()
            .frame(width: 170, height: 170)
            .clipShape(.circle)
            .shadow(radius: 20)
            .overlay(
                Circle().stroke(.green, lineWidth: 4)
            )
    }
}

#Preview {
    PetsDetailView(pet: Pet(name: "Diva", kind: "Dog", trick: "Begging", picture: "diva"))
}
