//
//  ContentView.swift
//  Navegacion2
//
//  Created by MAESTRO603 on 14/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Cartelera", systemImage: "film") {
                NavigationStack {
                    ListMovieView()
                        .navigationTitle(Text("CineBox"))
                }
            }
            Tab("Dulcería", systemImage: "popcorn") {
                NavigationStack {
                    DulceriaView()
                        .navigationTitle(Text("Dulcería"))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
