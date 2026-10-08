//
//  SeriesDetalleView.swift
//  holaMundo
//
//  Created by win603 on 21/08/26.
//

import SwiftUI

struct SeriesDetalleView: View {
    
    @State var imagen: ImageResource
    @State var categoria: String
    @State var nombre: String
    @State var temporadas: String
    
    var tipoBadge: Int
    
    var body: some View {
        VStack{
            Image(imagen).resizable().frame(width: 400).aspectRatio(contentMode: .fit).clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    VStack{
                        switch tipoBadge {
                        case 1:
                            Image(.capturaDePantalla20260821ALaS55224PM).resizable().frame(width: 40, height: 40)
                        case 2:
                            Image(.capturaDePantalla20260821ALaS55209PM).resizable().frame(width: 40, height: 40)
                        case 3:
                            Image(.capturaDePantalla20260821ALaS55224PM).resizable().frame(width: 40, height: 40)
                            Image(.capturaDePantalla20260821ALaS55209PM).resizable().frame(width: 40, height: 40)
                        case 4:
                            Image(.capturaDePantalla20260821ALaS55224PM).resizable().frame(width: 40, height: 40)
                            Image(.capturaDePantalla20260821ALaS55209PM).resizable().frame(width: 40, height: 40)
                            Spacer()
                            Text("Episodios Gratis").padding(5).background(.white).clipShape(RoundedRectangle(cornerRadius: 20))
                        default:
                            Spacer()
                            Text("Episodios Gratis").padding(5).background(.white).clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        
                        
                        
                    }.frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
            )
            VStack(alignment: .leading){
                Text(categoria).foregroundStyle(.gray).opacity(0.8)
                Text(nombre).foregroundStyle(.white).truncationMode(.middle)
                Text(temporadas).foregroundStyle(.gray).opacity(0.8)
            }.frame(maxWidth: .infinity, alignment: .leading)
            
        }.padding()
        
    }
}

#Preview {
    SeriesDetalleView(imagen: .capturaDePantalla20260821ALaS54719PM, categoria:"Drama", nombre: "Because This Is My First Life", temporadas: "1 temporada", tipoBadge: 1)
}
