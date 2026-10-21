import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Inicio", systemImage: "house") {
                InicioView()
            }
            Tab("Menú", systemImage: "cup.and.saucer") {
                MenuView()
            }
        }.tint(.purple)
        
    }
}
