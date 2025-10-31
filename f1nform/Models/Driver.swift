//
//  Driver.swift
//  f1nform
//
//  Created by Alex Bairez on 10/31/25.
//

import SwiftUI

struct Driver: Identifiable {
    let id = UUID()
    let position: Int
    let name: String
    let team: String
    let points: Int
    let teamColor: Color
}