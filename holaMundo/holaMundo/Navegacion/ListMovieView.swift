//
//  ListMovieView.swift
//  holaMundo
//
//  Created by win603 on 14/09/26.
//

import SwiftUI

struct ListMovieView: View {
    let movieList: [MovieModel] = MovieVM().getMovies()
    
    var body: some View {
        ScrollView(){
            VStack{
                ForEach(movieList, id: \.self.id){ movie in
                    MovieView(movie: movie)
                    
                }
            }
        }
        
    }
}

#Preview {
    ListMovieView()
}
