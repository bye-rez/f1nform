//
//  ConstructorStandings.swift
//  f1nform
//
//  Created by Alex Bairez on 10/31/25.
//

import SwiftUI

struct ConstructorStandings: View {
    let constructors: [Constructor]
    @Binding var showContent: Bool
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(Array(constructors.enumerated()), id: \.element.id) { index, constructor in
                    ConstructorCard(constructor: constructor)
                        .opacity(showContent ? 1 : 0)
                        .offset(x: showContent ? 0 : 100) // Slide in from right
                        .animation(
                            .easeOut(duration: 0.6)
                            .delay(Double(index) * 0.1),
                            value: showContent
                        )
                }
            }
            .padding()
        }
    }
}

#Preview {
    ConstructorStandings(
        constructors: [
            Constructor(position: 1, name: "McLaren", points: 618, primaryColor: .orange, secondaryColor: .black),
            Constructor(position: 2, name: "Ferrari", points: 552, primaryColor: .red, secondaryColor: .yellow),
            Constructor(position: 3, name: "Red Bull Racing", points: 544, primaryColor: .blue, secondaryColor: .yellow)
        ],
        showContent: .constant(true)
    )
}