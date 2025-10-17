//
//  ContentView.swift
//  f1nform
//
//  Created by Alex Bairez on 7/16/25.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        ScrollView {
            VStack {
                if #available(iOS 26.0, *) {
                    CardView(title: "hello", subtitle: "substring", imageName: "f1-logo")
                        .glassEffect()
                    CardView(title: "hello", subtitle: "substring", imageName: "f1-logo")
                        .glassEffect()
                    CardView(title: "hello", subtitle: "substring", imageName: "f1-logo")
                        .glassEffect()
                    CardView(title: "hello", subtitle: "substring", imageName: "f1-logo")
                        .glassEffect()
                    CardView(title: "hello", subtitle: "substring", imageName: "f1-logo")
                        .glassEffect()
                } else {
                    // Fallback on earlier versions
                    CardView(title: "hello", subtitle: "substring", imageName: "f1-logo.jpg")
                }
            }
            .padding()
        }
    }
}

#Preview {
    NewsView()
}
