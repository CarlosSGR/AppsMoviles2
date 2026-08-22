//
//  AuraView.swift
//  holaMundo
//
//  Created by win603 on 19/08/26.
//

import SwiftUI

struct AuraView: View {
    
    @State var auraLevel: Int = 0
    @State var excess: String = "Exceso de aura"
    @State var random = 0
    var miGradiente = LinearGradient(colors: [.red, .orange, .yellow, .green, .blue, .purple], startPoint: .leading, endPoint: .bottomLeading)
    
    func aumentarAura(){
        auraLevel += 50
        escalado += 0.10
    }
    
    func cambiarColor() -> LinearGradient{
        if (auraLevel >= 500){
            return miGradiente
        } else {
            return LinearGradient(colors: [Color.purple], startPoint: .leading, endPoint: .trailing)
        }
    }
    
    @State var escalado : CGFloat = 1.0
    
    
    var body: some View {
        
        VStack{
            Image(systemName: "person.fill").scaleEffect(escalado).rotationEffect(.degrees(escalado))
            Text("Nivel de aura: \(auraLevel)")
            
            
            Button(action: {
                withAnimation(){
                    aumentarAura()
                }
                random = Int.random(in: 0...100)
            })
            {
                Text("Farmear")
            }.padding().font(.largeTitle).background(cambiarColor()).clipShape(Capsule()).foregroundStyle(.white)
            
            Button(action: {
                auraLevel = 0
                escalado = 1
                excess = ""
            }){
                Text("Suspender evento")
            }
            
            if (auraLevel >= 500){
                Text(excess)
            }
        }
    }
}

#Preview {
    AuraView()
}
