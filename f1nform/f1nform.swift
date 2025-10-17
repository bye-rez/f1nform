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
                NewsView()
                    .tabItem {
                        Label("News", systemImage: "newspaper")
                    }
                StandingsView()
                    .tabItem {
                        Label("Standings", systemImage: "trophy")
                    }
            }
        }
    }
}
