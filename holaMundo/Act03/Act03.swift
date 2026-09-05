//
//  Act03.swift
//  holaMundo
//
//  Created by win603 on 04/09/26.
//

import SwiftUI

struct Act03: View {
    
    
    let imagenes: [ImageResource] = [.capturaDePantalla20260904ALaS53633PM, .capturaDePantalla20260904ALaS53648PM, .capturaDePantalla20260904ALaS53742PM]
    
    let nombres: [String] = ["Edge 60 Neo 12+256 Frosbite",
                             "Edge Standard Edition",
                             "iPhone 17 Pro Max"
                         ]
    
    let marcas = ["Motorola", "Motorola", "Apple"]
    let precios = ["$4,799", "$4,799", "$19,999"]
    
    @State var productoSeleccionado: Int = 0
    
    func cambiarProducto(a indice: Int) {
        productoSeleccionado = indice
    }
    
    var body: some View {
        
        
        
        VStack(alignment: .leading){
            Text(nombres[productoSeleccionado]).font(.system(size: 30))
                
            Text(precios[productoSeleccionado]).font(.system(size: 40)).bold()
            
            Image(imagenes[productoSeleccionado]).resizable().frame(width: 300, height: 400)
            
            Text("Marca: \(marcas[productoSeleccionado])")
            
            HStack{
                Button(action: {
                    cambiarProducto(a: 0)
                }){
                    Image(imagenes[0]).resizable().frame(width: 50, height: 50)
                }
                
                Button(action: {
                    cambiarProducto(a: 1)
                }){
                    Image(imagenes[1]).resizable().frame(width: 50, height: 50)
                }
                
                Button(action: {
                    cambiarProducto(a: 2)
                }){
                    Image(imagenes[2]).resizable().frame(width: 50, height: 50)
                }
            }
            
        }.padding().frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .center))
        Spacer()
    }
}

#Preview {
    Act03()
}
