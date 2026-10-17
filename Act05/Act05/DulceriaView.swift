//
//  DulceriaView.swift
//  Navegacion2
//

import SwiftUI

struct DulceriaView: View {
    let categorias: [CategoriaModel] = DulceriaViewModel().getCategorias()

    var body: some View {
        ScrollView(){
            VStack(spacing: 16){
                Text("Elige una categoría")
                    .font(.title2)
                    .fontWeight(.bold)

                ForEach(categorias, id: \.self.id){ categoria in
                    NavigationLink(destination: ProductosDulceriaView(categoria: categoria), label: {
                        Label(categoria.nombre, systemImage: categoria.icono)
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(12)
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        DulceriaView()
    }
}
