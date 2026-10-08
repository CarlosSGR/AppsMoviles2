//
//  ProfileView.swift
//  holaMundo
//
//  Created by win603 on 05/10/26.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("nombre") private var nombreGuardado = ""
    @AppStorage("edad") private var edadGuardada = ""
    @State var nombre: String = ""
    @State var edad: String = "0"
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Text("Datos previamente guardados:")
                Text("Nombre: \(nombre)")
                Text("Edad: \(edad)")
                Text("¿Cúal es tu nombre?")
                TextField("Escribe tu respuesta aquí", text: $nombre).frame(maxWidth: 200)
                Text("¿Cúal es tu edad?")
                TextField("Escribe tu respuesta aquí", text: $edad).frame(maxWidth: 200)
                HStack{
                    Button(action: {
                        nombreGuardado = nombre
                        edadGuardada = edad
                    }){
                        Text("Guardar")
                    }.buttonStyle(.borderedProminent).tint(.green)
                    Button(action: {
                       nombre = ""
                        edad = ""
                    }){
                        Text("Borrar")
                    }.buttonStyle(.borderedProminent).tint(.red)
                }
                
            }
            Spacer()
        
        }
        
    }
}

#Preview {
    ProfileView()
}
