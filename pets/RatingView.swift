//
//  FreakyView.swift
//  pets
//
//  Created by Daniel Gonzalez on 7/8/24.
//

import SwiftUI

struct RatingView: View {
    @State private var rating: Int = 5

    var body: some View {
        VStack {
            RatingGauge(rating: $rating)
                .padding([.leading, .trailing])
            HStack {
                Button(action: {
                    withAnimation {
                        rating -= 1
                    }
                }) {
                    Image(systemName: "minus.circle")
                }
                .disabled(rating == 0)
                
                Text(String(format: "%02d", rating))
                    .contentTransition(.numericText(value: Double(rating)))
                    .font(.largeTitle)
                    .fontDesign(.monospaced)
                    .frame(width: 45)
                    .fontWeight(.bold)
                
                Button(action: {
                    withAnimation {
                        rating += 1
                    }
                }) {
                    Image(systemName: "plus.circle")
                }
                .disabled(rating == 10)
            }
        }
        .frame(width: 150, height: 150)
        .background(Color(.systemGray6))
        .clipShape(.rect(cornerRadius: 15))
        .shadow(radius: 1)
    }
}

struct RatingGauge: View {
    @Binding var rating: Int
    
    var body: some View {
        Gauge(value: Double(rating), in: 0...10) {
            Text("Rating")
        }
    }
}

#Preview {
    RatingView()
}
