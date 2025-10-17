//
//  CardView.swift
//  f1nform
//
//  Created by Alex Bairez on 10/17/25.
//
import SwiftUI

struct CardView: View {
    var title: String
    var subtitle: String
    var imageName: String
    
    var body: some View {
        // layout
        VStack {
            // image
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .padding(10)
            
            // text for title
            Text(title)
                .font(.headline)
                .padding(.top, 8)
            
            // text for subtitle
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "card title", subtitle: "subtitle", imageName: "exampleImage")
            .previewLayout(.sizeThatFits)
    }
}
