//
//  AddProductView.swift
//  DatosApp
//

import SwiftUI
import SwiftData

struct AddProductView: View {
    @Bindable var viewModel: ProductViewModel
    @Environment(\.modelContext) private var modelContext

    @State private var showAlert = false
    @State private var alert: ProductAlert?

    var body: some View {
        GroupBox {
            ProductView(product: viewModel.product)
            ProductButton(title: "Agregar", systemImage: "plus") {
                let result = viewModel.addProduct(context: modelContext)
                alert = viewModel.alert(for: result)
                showAlert = true
            }
        }
        .alert(alert?.title ?? "", isPresented: $showAlert) {
            Button("OK") { }
        } message: {
            Text(alert?.message ?? "")
        }
    }
}
