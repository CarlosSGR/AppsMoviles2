//
//  Game.swift
//  holaMundo
//
//  Created by win603 on 21/09/26.
//

import Foundation

struct Game : Identifiable {
    
    let uurid: UUID = UUID()
    let id: Int
    let image: String
    let name: String
    let console: String
    let price: Float
}
