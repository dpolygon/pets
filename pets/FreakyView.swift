//
//  FreakyView.swift
//  pets
//
//  Created by Daniel Gonzalez on 7/8/24.
//

import SwiftUI

struct FreakyView: View {
    @State private var rating: Int = 5

    var body: some View {
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
}

#Preview {
    FreakyView()
}
