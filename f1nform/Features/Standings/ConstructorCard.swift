//
//  ConstructorCard.swift
//  f1nform
//
//  Created by Alex Bairez on 10/31/25.
//

import SwiftUI

struct ConstructorCard: View {
    let constructor: Constructor
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            print("\(constructor.name) tapped!")
        }) {
            HStack {
                Circle()
                    .fill(positionColor(constructor.position))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text("\(constructor.position)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    )
                    .scaleEffect(isPressed ? 1.1 : 1.0)
                
                // Team color stripe
                RoundedRectangle(cornerRadius: 4)
                    .fill(LinearGradient(
                        colors: [constructor.primaryColor, constructor.secondaryColor],
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .frame(width: 6, height: 50)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(constructor.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text("Constructor")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                VStack {
                    Text("\(constructor.points)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(constructor.primaryColor)
                    Text("PTS")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            .scaleEffect(isPressed ? 0.98 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = pressing
            }
        }, perform: {})
    }
    
    func positionColor(_ position: Int) -> Color {
        switch position {
        case 1: return .yellow
        case 2: return .gray
        case 3: return .orange
        default: return .blue
        }
    }
}

#Preview {
    ConstructorCard(constructor: Constructor(position: 1, name: "McLaren", points: 618, primaryColor: .orange, secondaryColor: .black))
        .padding()
}