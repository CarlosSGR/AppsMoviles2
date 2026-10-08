//
//  SinopsisView.swift
//  holaMundo
//
//  Created by win603 on 14/09/26.
//

import SwiftUI

struct SinopsisView: View {
    var movie: MovieModel
    
    var body: some View {
        VStack{
            Image(movie.imagen).resizable().scaledToFit().frame(width: 300, height: 350)
            Text(movie.nombre).font(.title).padding()
            HStack{
                Image(systemName: "calendar")
                Text(movie.anho.formatted())
                Text("|")
                Image(systemName: "clock")
                Text("\(movie.duracion) min")
                
            }
            HStack{
                Image(systemName: "ticket")
                Text(movie.generos)
            }
            
            Button(action: {
                
            }){
                Text("Comprar boleto").foregroundStyle(.white).bold().padding(.vertical, 10).padding(.horizontal, 30).background(.blue).clipShape(Capsule())
            }
        }.padding()
        Spacer()
    }
}

#Preview {
    SinopsisView(movie: MovieVM().getMovies()[0])
}
