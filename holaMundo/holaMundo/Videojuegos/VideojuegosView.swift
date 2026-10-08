//
//  VideojuegosView.swift
//  holaMundo
//
//  Created by win603 on 21/09/26.
//

import SwiftUI

struct VideojuegosView: View {
    var image : String
    var name : String
    var console : String
    var price : String
    
    var body: some View {
        HStack {
            Image(image).resizable().scaledToFit().frame(width: 120, height: 100).padding(.horizontal)
            VStack(alignment: .leading, spacing: 0 ){
                Text(name).foregroundColor(Color.purple).font(.headline).padding(.bottom)
                HStack{
                    Text(console).font(.caption)
                    Spacer()
                    Text(price + " MXN").font(.caption).fontWeight(.bold)
                }
                HStack(){
                    Spacer()
                    Button(action: {
                        print("hola")
                    }, label:{
                        Text("Comprar").padding(.horizontal).foregroundColor(Color.white).background(Color.purple).cornerRadius(4).padding(.vertical)
                    })
                }.onAppear{
                    print("Mostrando juego \(self.name)")
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VideojuegosView(image: "repo", name: "REPO", console: "PC", price: "1 Gazillion")
    }
}
