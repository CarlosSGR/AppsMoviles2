//
//  MovieViewModel.swift
//  holaMundo
//
//  Created by win603 on 18/09/26.
//

import Foundation
import SwiftUI

struct MovieVM {
    func getMovies() ->[MovieModel] {
        
        let movies = [
        MovieModel(id: 1, nombre: "Isle of Dogs", imagen: .poster, anho: 2018, generos: "AVENTURA, FANTASÍA", duracion: 102),
        MovieModel(id: 2, nombre: "Scott Pilgrim vs. the World", imagen: .scott, anho: 2010, generos: "COMEDIA, ACCIÓN", duracion: 112),
        MovieModel(id: 3, nombre: "Ready Player One", imagen: .ready, anho: 2018, generos: "COMEDIA, FANTASÍA", duracion: 140),
        MovieModel(id: 4, nombre: "The Batman", imagen: .batman, anho: 2022, generos: "ACCIÓN, AVENTURA", duracion: 176),
        MovieModel(id: 5, nombre: "Chainsaw Man", imagen: .csm, anho: 2025, generos: "ANIME, FANTASÍA OSCURA", duracion: 101),
        ]
        
        return movies
    }
}
