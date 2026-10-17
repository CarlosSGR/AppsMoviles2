//
//  MovieViewModel.swift
//  Navegacion2
//
//  Created by MAESTRO603 on 18/09/26.
//

import Foundation
import SwiftUI

struct MovieViewModel {

    func getMovies() -> [MovieModel] {

        let movies = [

            MovieModel(id: 1, title: "Castillo Infitio 1",
                       synopsis: "Los cazadores caen dentro de una fortaleza que cambia de forma a cada instante y deberán enfrentar a sus enemigos más poderosos para poder salir con vida.",
                       poster: .resident, date: "2023", time: 180, genre: "Infantil" ),

            MovieModel(id: 2, title: "Resident Evil 0",
                       synopsis: "Una novata del equipo de rescate y un prisionero fugitivo deberán unir fuerzas dentro de un tren infestado para descubrir el origen del virus.",
                       poster: .resident, date: "2026", time: 125, genre: "Terror" ),

            MovieModel(id: 3, title: "Moana",
                       synopsis: "Una joven valiente cruza el océano en busca de un semidiós para devolverle la vida a su isla y descubrir quién está destinada a ser.",
                       poster: .resident, date: "2026", time: 80, genre: "Musical" ),

            MovieModel(id: 4, title: "Spiderman",
                       synopsis: "Peter Parker intenta equilibrar su vida de estudiante con la responsabilidad de proteger su ciudad mientras un nuevo villano amenaza a quienes más quiere.",
                       poster: .resident, date: "2026", time: 95, genre: "Accion" ),

            MovieModel(id: 5, title: "Odisea",
                       synopsis: "Tras la guerra, un rey emprende un largo viaje de regreso a casa enfrentando monstruos, dioses y tormentas para reencontrarse con su familia.",
                       poster: .resident, date: "2026", time: 200, genre: "Todo" ),

        ]
        return movies

    }

}
