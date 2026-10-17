//
//  SinopsisView.swift
//  Navegacion2
//
//  Created by MAESTRO603 on 14/09/26.
//

import SwiftUI

struct SinopsisView: View {
    let movie: MovieModel

    var body: some View {
        ScrollView(){
            VStack {
                Image(movie.poster)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 400)

                HStack{
                    Text(movie.date)
                    Spacer()
                    Text("\(movie.time) min")
                    Spacer()
                    Text(movie.genre)
                }
                .padding(.horizontal, 60)
                .padding(.vertical)

                Text(movie.synopsis)
                    .padding(.horizontal)

                Button(action:{}){
                    Text("Comprar boleto")
                }
                .padding(10)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(50)
                .padding()
            }
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SinopsisView(movie: MovieViewModel().getMovies()[0])
    }
}
