//
//  ContentView.swift
//  holaMundo
//
//  Created by win603 on 05/08/26.
//

import SwiftUI

struct ContentView: View {
    //En esta parte se pone pura lógica
    
    
    //De aquí a abajo se pone pura cosa visual
    var body: some View {
        Text("Hola chaval")
            .padding(.top, 20)
            .background(Color.red)
            .padding()
            .background(.blue)
            .frame(width: 300, height: 300)
            .font(.largeTitle)
            .foregroundColor(.yellow)
        
    }
}

#Preview {
    ContentView()
}
