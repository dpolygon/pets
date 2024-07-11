 //
//  ContentView.swift
//  pets
//
//  Created by Daniel Gonzalez on 7/6/24.
//

import SwiftUI

struct RowView: View {
    var pet: Pet
    
    var body: some View {
        HStack(alignment: .center) {
            profileImage
            VStack(alignment: .leading) {
                HStack {
                    Text(pet.name)
                    if pet.hasAward {
                        Image(systemName: "trophy")
                            .foregroundColor(.yellow)
                    }
                }
                Text(pet.trick)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
    }
    
    private var profileImage: some View {
        Image(pet.picture)
            .resizable()
            .scaledToFill()
            .frame(width: 60, height: 60)
            .clipShape(.circle)
            .shadow(radius: 3)
            .overlay {
                Circle().stroke(.green, lineWidth: 2)
            }
    }
}

#Preview {
    RowView(pet: Pet(name: "Turt", kind: "Turtle", trick: "Standing still", picture: "turt"))
}
