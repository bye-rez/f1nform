//
//  DriverStandings.swift
//  f1nform
//
//  Created by Alex Bairez on 10/31/25.
//

import SwiftUI

struct DriverStandings: View {
    let drivers: [Driver]
    @Binding var showContent: Bool
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                // ANIMATION LESSON 3: Staggered entry animations
                ForEach(Array(drivers.enumerated()), id: \.element.id) { index, driver in
                    DriverCard(driver: driver)
                        .opacity(showContent ? 1 : 0)
                        .offset(x: showContent ? 0 : -100) // Slide in from left
                        .animation(
                            .easeOut(duration: 0.6)
                            .delay(Double(index) * 0.1), // Stagger each card by 0.1 seconds
                            value: showContent
                        )
                }
            }
            .padding()
        }
    }
}

#Preview {
    DriverStandings(
        drivers: [
            Driver(position: 1, name: "Max Verstappen", team: "Red Bull Racing", points: 575, teamColor: .blue),
            Driver(position: 2, name: "Lando Norris", team: "McLaren", points: 356, teamColor: .orange),
            Driver(position: 3, name: "Charles Leclerc", team: "Ferrari", points: 308, teamColor: .red)
        ],
        showContent: .constant(true)
    )
}