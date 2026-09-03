//
//  TareaTextos.swift
//  holaMundo
//
//  Created by win603 on 02/09/26.
//

import SwiftUI

struct TareaTextos: View {
    var miGradiente = LinearGradient(colors: [ .yellow, .green, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        VStack{
            HStack{
                Text("Amarillo").foregroundStyle(.green)
                Text("Azul").foregroundStyle(.red)
                Text("Naranja").foregroundStyle(.blue)
            }.font(.system(size: 25))
            HStack{
                Text("NEGRO").padding().foregroundStyle(.black).background(.colorPersonalizado1)
                Spacer()
                Text("ROJO").padding(.vertical,1).foregroundStyle(.red).frame(width: 80).background(.colorPersonalizado2).clipShape(.capsule)
            }.padding(.horizontal, 50).padding(.vertical, 10)
            Text("Verde").frame(maxWidth: .infinity).padding(.vertical, 20).background(.orange).foregroundStyle(.white).font(.system(size: 35)).fontWeight(.bold)
            HStack{
                Text("Morado").padding(.horizontal, 10).padding(.bottom, 15).font(.system(size: 25)).background(miGradiente).overlay(){
                    Rectangle().stroke(.black, lineWidth: 2)
                }.padding(.top, 10)
                Spacer()
            }
            
            Text("Prueba de colores").font(.system(size: 25)).shadow(color: .red, radius: 5).rotationEffect(.degrees(45)).padding(.top, 250).italic()
            HStack{
                Spacer()
                Text("Naranja").underline().padding(.trailing).offset(y: 180)
            }
            Spacer()
        }
    }
}

#Preview {
    TareaTextos()
}
