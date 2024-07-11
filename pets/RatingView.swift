//
//  FreakyView.swift
//  pets
//
//  Created by Daniel Gonzalez on 7/8/24.
//

import SwiftUI

struct RatingView: View {
    var pet: Pet

    var body: some View {
        VStack {
            RatingGauge(rating: pet.rating)
                .padding([.leading, .trailing])
            HStack {
                Button(action: {
                    withAnimation {
                        pet.rating -= 1
                    }
                }) {
                    Image(systemName: "minus.circle")
                }
                .disabled(pet.rating == 0)
                
                Text(String(format: "%02d", pet.rating))
                    .contentTransition(.numericText(value: Double(pet.rating)))
                    .font(.largeTitle)
                    .fontDesign(.monospaced)
                    .frame(width: 45)
                    .fontWeight(.bold)
                
                Button(action: {
                    withAnimation {
                        pet.rating += 1
                    }
                }) {
                    Image(systemName: "plus.circle")
                }
                .disabled(pet.rating == 10)
            }
        }
        .frame(width: 150, height: 150)
        .background(Color(.systemGray6))
        .clipShape(.rect(cornerRadius: 15))
        .shadow(radius: 1)
    }
}

struct RatingGauge: View {
    var rating: Int
    
    var body: some View {
        Gauge(value: Double(rating), in: 0...10) {
            Text("Rating")
        }
    }
}

#Preview {
    RatingView(pet: Pet(name: "Diva", kind: "Dog", trick: "Begging", picture: "diva"))
}
