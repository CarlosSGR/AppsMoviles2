//
//  ContadorView.swift
//  holaMundo
//
//  Created by win603 on 07/10/26.
//

import SwiftUI

struct ContadorView: View {
    @AppStorage("contadonx") var contadorGuardado = 0
    @Bindable var contable: ContadorClass
    
    var body: some View {
        VStack{
            Text("Contador")
            Button(action: {
                withAnimation(){
                    contable.start()
                    contable.aumentar()
                }
                
            }){
                Text("Aumentar")
            }.buttonStyle(.borderedProminent).tint(.blue)
            Button(action: {
                withAnimation(){
                    contable.stop()
                    contable.disminuir()
                }
            }){
                Text("Disminuir")
            }.buttonStyle(.borderedProminent).tint(.yellow)
            
            Button(action: {
                contadorGuardado = contable.contador
            }){
                Text("Guardar")
            }.buttonStyle(.borderedProminent).tint(.green)
            
            Text("\(contable.contador)")
            Text("Contador Guardado : \(contadorGuardado)")
            
            Text("Tiempo transcurrido: \(contable.number)")
        }
    }
}

#Preview {
    ContadorView(contable: ContadorClass())
}
