//
//  Standings.swift
//  f1nform
//
//  Created by Alex Bairez on 7/16/25.
//

import SwiftUI

struct Standings: View {
    @State private var selectedTab = 0
    @State private var showContent = false
    
    // Sample F1 2024 data - in real app this would come from an API
    let drivers = [
        Driver(position: 1, name: "Max Verstappen", team: "Red Bull Racing", points: 575, teamColor: .blue),
        Driver(position: 2, name: "Lando Norris", team: "McLaren", points: 356, teamColor: .orange),
        Driver(position: 3, name: "Charles Leclerc", team: "Ferrari", points: 308, teamColor: .red),
        Driver(position: 4, name: "Oscar Piastri", team: "McLaren", points: 262, teamColor: .orange),
        Driver(position: 5, name: "Carlos Sainz", team: "Ferrari", points: 244, teamColor: .red),
        Driver(position: 6, name: "George Russell", team: "Mercedes", points: 192, teamColor: .gray),
        Driver(position: 7, name: "Lewis Hamilton", team: "Mercedes", points: 190, teamColor: .gray),
        Driver(position: 8, name: "Sergio Perez", team: "Red Bull Racing", points: 151, teamColor: .blue)
    ]
    
    let constructors = [
        Constructor(position: 1, name: "McLaren", points: 618, primaryColor: .orange, secondaryColor: .black),
        Constructor(position: 2, name: "Ferrari", points: 552, primaryColor: .red, secondaryColor: .yellow),
        Constructor(position: 3, name: "Red Bull Racing", points: 544, primaryColor: .blue, secondaryColor: .yellow),
        Constructor(position: 4, name: "Mercedes", points: 382, primaryColor: .gray, secondaryColor: .green),
        Constructor(position: 5, name: "Aston Martin", points: 86, primaryColor: .green, secondaryColor: .black),
        Constructor(position: 6, name: "Alpine", points: 49, primaryColor: .pink, secondaryColor: .blue),
        Constructor(position: 7, name: "Haas", points: 46, primaryColor: .white, secondaryColor: .red),
        Constructor(position: 8, name: "RB", points: 44, primaryColor: .purple, secondaryColor: .blue)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // ANIMATION LESSON 1: Segmented Picker with smooth transitions
                Picker("Championships", selection: $selectedTab) {
                    Text("Drivers").tag(0)
                    Text("Constructors").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                // This animates the tab switching
                .animation(.easeInOut(duration: 0.3), value: selectedTab)
                
                // ANIMATION LESSON 2: Content with asymmetric slide transitions
                ZStack {
                    if selectedTab == 0 {
                        DriverStandings(drivers: drivers, showContent: $showContent)
                            // Different slide directions for each view
                            .transition(.asymmetric(
                                insertion: .move(edge: .leading).combined(with: .opacity),
                                removal: .move(edge: .trailing).combined(with: .opacity)
                            ))
                    } else {
                        ConstructorStandings(constructors: constructors, showContent: $showContent)
                            .transition(.asymmetric(
                                insertion: .move(edge: .trailing).combined(with: .opacity),
                                removal: .move(edge: .leading).combined(with: .opacity)
                            ))
                    }
                }
                // Spring animation for smooth, bouncy transitions
                .animation(.spring(response: 0.6, dampingFraction: 0.8), value: selectedTab)
            }
            .navigationTitle("F1 Championships")
            .onAppear {
                showContent = true
            }
        }
    }
}

#Preview {
    Standings()
}
