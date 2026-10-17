//
//  ProductoDulceriaView.swift
//  Navegacion2
//

import SwiftUI

struct ProductoDulceriaView: View {
    let producto: ProductoModel
    let action: () -> Void

    var body: some View {
        HStack{
            Image(producto.imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)

            VStack(alignment: .leading){
                Text(producto.nombre)
                    .font(.headline)
                Text("$" + String(producto.precio) + " MXN")
                    .font(.caption)
                    .fontWeight(.bold)
            }

            Spacer()

            Button(action: action){
                Text("Agregar")
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 3)
        .padding(.horizontal)
    }
}

#Preview {
    ProductoDulceriaView(producto: DulceriaViewModel().getCategorias()[0].productos[0], action: {})
}
