//
//  ContentView.swift
//  holaMundo
//
//  Created by win603 on 21/09/26.
//

import SwiftUI

struct ContentView2: View {
    @State var gamesViewModel = GamesViewModel().dummyData()
    var body: some View {
        List() {
            ForEach(gamesViewModel , id: \.self.uurid) { game in VideojuegosView(image: game.image, name: game.name, console: game.console, price: String(game.price)).padding(.trailing).background(Color("cardColor")).cornerRadius(15).padding(4).listRowInsets(EdgeInsets())
            }.onDelete {
                (indexSet) in self.gamesViewModel.remove(atOffsets:indexSet)
            }
        }.listStyle(PlainListStyle())
    }
}

#Preview {
    ContentView2()
}


