//
//  ProductosView.swift
//  DatosApp
//
//  Es el ContentView del tutorial, ahora dentro de un Tab.
//

import SwiftUI
import SwiftData

struct ProductosView: View {
    @State private var viewModel = ProductViewModel()
    @Query private var products: [Product]

    var body: some View {
        NavigationSplitView {
            VStack {
                AddProductView(viewModel: viewModel)
                ProductListView(products: products, viewModel: viewModel)
            }
            .padding()
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer, prompt: "Buscar producto")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .navigationTitle("Base de Datos Local")
        } detail: {
            Text("Selecciona un Producto")
        }
    }
}
