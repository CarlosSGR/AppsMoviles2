//
//  MovieView.swift
//  holaMundo
//
//  Created by win603 on 18/09/26.
//

import SwiftUI

struct MovieView: View {
    var movie: MovieModel
    var body: some View {
        VStack{
            Image(movie.imagen).resizable().scaledToFit().frame(width: 300, height: 350).padding()
            Text(movie.nombre).font(.title3)
            
            Text("Ver Sinopsis").foregroundStyle(.blue)
        }
    }
}

#Preview {
    MovieView(movie: MovieVM().getMovies()[0])
}
