//
//  PokemonVM.swift
//  MyApp
//
//  Created by win603 on 14/10/26.
//

import Foundation
import Observation

@MainActor
@Observable final class PokemonVM{
    
    var pokemones: Pokemon = Pokemon(count: 0, next: "", previous: "", results: [])
    
    func getPokeDataFromApi() async{
        let urlString = "https://pokeapi.co/api/v2/pokemon"
        
        guard let url = URL(string: urlString) else {
            print("Url no valida o no definida")
            return
        }
        
        var urlRequest = URLRequest(url:url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error sin respuesta del servidor")
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                print("Status \(httpResponse.statusCode)")
                return
            }
            
            let decoded = try JSONDecoder().decode(Pokemon.self, from: data)
            pokemones = decoded
            
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
