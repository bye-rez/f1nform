//
//  f1nformApp.swift
//  f1nform
//
//  Created by Alex Bairez on 7/16/25.
//

import SwiftUI

@main
struct f1nform: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                News()
                    .tabItem {
                        Label("News", systemImage: "newspaper")
                    }
                Standings()
                    .tabItem {
                        Label("Standings", systemImage: "trophy")
                    }
            }
        }
    }
}
