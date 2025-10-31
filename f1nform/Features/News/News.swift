//
//  ContentView.swift
//  f1nform
//
//  Created by Alex Bairez on 7/16/25.
//

import SwiftUI

struct News: View {
    var body: some View {
        ScrollView {
            VStack {
                if #available(iOS 26.0, *) {
                    NewsCard(title: "hello", subtitle: "substring", imageName: "f1-logo")
                    NewsCard(title: "hello", subtitle: "substring", imageName: "f1-logo")
                    NewsCard(title: "hello", subtitle: "substring", imageName: "f1-logo")
                } else {
                    // Fallback on earlier versions
                    NewsCard(title: "hello", subtitle: "substring", imageName: "f1-logo.jpg")
                }
            }
            .padding()
        }
    }
}

#Preview {
    News()
}
