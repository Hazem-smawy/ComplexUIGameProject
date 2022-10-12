//
//  Model.swift
//  ComplexUIGameProject
//
//  Created by hazem smawy on 10/11/22.
//

import SwiftUI

// MARK: - data
struct Player: Identifiable {
    var id: Int
    var powers:[CGFloat]
    var image: String
    var name: String
    var color: Color
}

var data :[Player] = [
    .init(id: 0, powers: [0.2,0.5,0.9], image: "1", name: "Bomb Raider", color: .purple.opacity(0.5)),
    .init(id: 1, powers: [0.3,0.5,0.6], image: "2", name: "Pekka", color: .orange.opacity(0.5)),
    .init(id: 2, powers: [0.5,0.4,0.8], image: "5", name: "Barberian", color: .pink.opacity(0.5)),
    .init(id: 3, powers: [0.2,0.5,0.9], image: "4", name: "Bomb Raider", color: .blue.opacity(0.5)),
    .init(id: 4, powers: [0.3,0.5,0.6], image: "5", name: "Pekka", color: .green.opacity(0.5))

]


