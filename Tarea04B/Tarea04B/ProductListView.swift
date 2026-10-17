//
//  ProductListView.swift
//  DatosApp
//

import SwiftUI
import SwiftData

struct ProductListView: View {
    let products: [Product]
    var viewModel: ProductViewModel
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        List {
            ForEach(viewModel.filteredProducts(from: products)) { product in
                NavigationLink(
                    destination: EditProductView(item: product)
                ) {
                    Text(product.name)
                }
            }
            .onDelete { offsets in
                let filteredProducts =
                    viewModel.filteredProducts(from: products)
                viewModel.deleteProduct(offsets: offsets,
                                        products: filteredProducts,
                                        context: modelContext)
            }
        }
    }
}
