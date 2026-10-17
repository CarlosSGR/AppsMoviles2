//
//  ListMovieView.swift
//  Navegacion2
//
//  Created by MAESTRO603 on 14/09/26.
//

import SwiftUI

struct ListMovieView: View {
    let movieList: [MovieModel] = MovieViewModel().getMovies()

    var body: some View {
        ScrollView(){
            VStack{
                ForEach(movieList, id: \.self.id){ pelicula in
                    NavigationLink(destination: SinopsisView(movie: pelicula), label: {
                        MovieView(movie: pelicula)
                    })
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListMovieView()
    }
}
