//
//  NavegacionView.swift
//  holaMundo
//
//  Created by win603 on 14/09/26.
//

import SwiftUI

struct NavegacionView: View {
    let movieList: [MovieModel] = MovieVM().getMovies()
    var body: some View {
        VStack{
            NavigationStack{
                NavigationLink(destination:
                                SinopsisView(movie: movieList[0])
                ){
                    ListMovieView().navigationTitle("Cinepolis")
                    
                }
            }
        }
    }
}

#Preview {
    NavegacionView()
}
