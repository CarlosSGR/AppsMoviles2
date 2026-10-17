//
//  ContentView.swift
//  examenParcial01
//
//  Created by win603 on 09/09/26.
//

import SwiftUI

struct ContentView: View {

    @State var dptoVM = deptoVM().dummyData()
    
    
    var body: some View {
        VStack{
            HStack{
                Text("Departamentos").font(.title)
                Spacer()
            }
            
            List(){
                ForEach(dptoVM, id: \.self.uuid) { dpto in departamentosDetalle(imagen: dpto.imagen, direccion: dpto.direccion, departamento: "caca", nombre: dpto.nombre, calificacion: dpto.calificacion, precio: dpto.precio, superficie: dpto.superficie)
                    
            }
         
        }
            Spacer()
        }.padding()
    }
}

#Preview {
    ContentView()
}
