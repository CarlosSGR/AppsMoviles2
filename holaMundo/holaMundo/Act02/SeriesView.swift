//
//  SeriesView.swift
//  holaMundo
//
//  Created by win603 on 21/08/26.
//

import SwiftUI

struct SeriesView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Lo más buscado").foregroundStyle(.white).font(.largeTitle).fontWeight(.bold)
                Spacer()
            }.padding(.horizontal)
                Spacer()
            ScrollView(.horizontal, showsIndicators: true){
                HStack{
                    SeriesDetalleView(imagen: .capturaDePantalla20260821ALaS54719PM, categoria:"Drama", nombre: "Because This Is My First Life", temporadas: "1 temporada")
                    SeriesDetalleView(imagen: .capturaDePantalla20260821ALaS54848PM, categoria:"Drama", nombre: "Dinastía Casillas", temporadas: "1 temporada")
                    SeriesDetalleView(imagen: .capturaDePantalla20260821ALaS54917PM, categoria:"Drama", nombre: "La Esclava Isaura", temporadas: "167 episodios")
                    SeriesDetalleView(imagen: .capturaDePantalla20260821ALaS54927PM, categoria:"Revive las Galas con anuncios", nombre: "La Casa de los Famosos México: Galas Estelares", temporadas: "12:27 pm - 3:06 pm")
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.black)
        
        
        
    }
}

#Preview {
    SeriesView()
}
