//
//  DriverCard.swift
//  f1nform
//
//  Created by Alex Bairez on 10/31/25.
//

import SwiftUI

struct DriverCard: View {
    let driver: Driver
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            print("\(driver.name) tapped!")
        }) {
            HStack {
                // ANIMATION LESSON 4: Interactive button press animations
                Circle()
                    .fill(positionColor(driver.position))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text("\(driver.position)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    )
                    // Scale effect on press
                    .scaleEffect(isPressed ? 1.1 : 1.0)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(driver.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(driver.team)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                VStack {
                    Text("\(driver.points)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(driver.teamColor)
                    Text("PTS")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            // Whole card scales down slightly when pressed
            .scaleEffect(isPressed ? 0.98 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        // Gesture to handle press state
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = pressing
            }
        }, perform: {})
    }
    
    func positionColor(_ position: Int) -> Color {
        switch position {
        case 1: return .yellow    // Gold for 1st
        case 2: return .gray      // Silver for 2nd  
        case 3: return .orange    // Bronze for 3rd
        default: return .blue     // Blue for others
        }
    }
}

#Preview {
    DriverCard(driver: Driver(position: 1, name: "Max Verstappen", team: "Red Bull Racing", points: 575, teamColor: .blue))
        .padding()
}