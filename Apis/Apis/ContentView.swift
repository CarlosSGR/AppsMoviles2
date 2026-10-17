import SwiftUI
import Playgrounds

struct ContentView: View {
    
    @State var pokemonVM = PokemonVM()
    var body: some View {
        VStack{
            Text("Pokedex")
            List {
                ForEach(pokemonVM.pokemones.results){
                    pokemon in
                    VStack{
                        Text("\(pokemon.name)")
                        Text("\(pokemon.url)")
                    }
                }
            }
        }.task {
            await pokemonVM.getPokeDataFromApi()
        }
    }
}

#Preview {
    ContentView()
}

