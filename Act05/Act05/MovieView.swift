//
//  MovieView.swift
//  Navegacion2
//
//  Created by MAESTRO603 on 18/09/26.
//

import SwiftUI

struct MovieView: View {
    var movie: MovieModel

    var body: some View {
        VStack{
            Image(movie.poster)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .padding()

            Text(movie.title)
                .font(.title3)
                .foregroundColor(Color.primary)

            Text("Ver Sinopsis")
                .foregroundStyle(Color.blue)
        }
    }
}

#Preview {
    MovieView( movie: (MovieViewModel().getMovies())[1])
}
