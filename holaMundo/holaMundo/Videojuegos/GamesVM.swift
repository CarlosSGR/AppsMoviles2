//
//  GamesVM.swift
//  holaMundo
//
//  Created by win603 on 21/09/26.
//

import Foundation

struct GamesViewModel{
    func dummyData() -> [Game] {
        let games: [Game] = [
            Game(id: 1, image: "repo", name: "R.E.P.O.", console: "PC", price: 100.00),
            Game(id: 2, image: "blasphemous", name: "Blasphemous", console: "PC", price: 400.00),
            Game(id: 3, image: "sh2", name: "Silent Hill 2", console: "XBOX/PS/PC", price: 1300.00),
            Game(id: 4, image: "re2", name: "Resident Evil 2", console: "XBOX/PS/PC", price: 800.00),
            Game(id: 5, image: "lol", name: "League of Legends", console: "PC", price: 0.00)
        ]
        return games
    }
}
