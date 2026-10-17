//
//  departamentosDetalle.swift
//  examenParcial01
//
//  Created by win603 on 09/09/26.
//

import SwiftUI

struct departamentosDetalle: View {
    let imagen: ImageResource
    let direccion: String
    let departamento: String
    let nombre: String
    let calificacion: CGFloat
    let precio: Int
    let superficie: CGFloat
    
    @State var estadoCorazon: Bool = false
    @State var estadoReserva: Bool = false
    
    
    
    
    var body: some View {
        VStack{
            Image(imagen).clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)).padding(.top, 0).overlay{
                Capsule().frame(width:150,height: 50 ).opacity(0.5).overlay{
                    HStack{
                        Image(systemName: "location")
                        Text(direccion)
                    }.foregroundStyle(.white).padding()
                }.offset(x:-100, y: -100)
                
                Circle().frame(width:50).opacity(0.5).overlay{
                    
                    Button(action: {
                        estadoCorazon.toggle()
                    }){
                        if estadoCorazon == false {
                            Image(systemName: "heart").resizable().frame(width:25, height: 25).foregroundStyle(.white)
                        } else {
                            Image(systemName: "heart.fill").resizable().frame(width:25, height: 25).foregroundStyle(.white)
                        }
                    }
            
                }.offset(x: 150, y: -100)
                
                HStack{
                    Button(action:{
                        estadoReserva.toggle()
                    }){
                        if estadoReserva == false {
                            Image(systemName: "house")
                            Text("Reservar")
                        } else {
                            Image(systemName: "xmark")
                            Text("Cancelar")
                        }
                    }
                    
                }.foregroundStyle(.white).padding().background(.colorFondo).clipShape(Capsule()).offset(y:100)
                
            }
            HStack{
                Text(nombre)
                Spacer()
                Image(systemName: "star.fill").foregroundStyle(.yellow)
                Text(calificacion)
            }.padding(.vertical, 8)
            HStack{
                Text(precio).bold()
                Text("al mes")
                Spacer()
                Text(superficie).foregroundStyle(.gray)
                Text("m2")
            }
            
            
        }.padding().padding(.vertical, 8)
    }
}

#Preview {
    departamentosDetalle(imagen: .depa01, direccion: "si", departamento: "Higashi", nombre: "si", calificacion: "si", precio: "si", superficie: "si")
}
