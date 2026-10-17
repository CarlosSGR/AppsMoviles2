//
//  AddEmpleadoView.swift
//  DatosApp
//

import SwiftUI
import SwiftData

struct AddEmpleadoView: View {
    @Bindable var viewModel: EmpleadoViewModel
    @Environment(\.modelContext) private var modelContext

    @State private var showAlert = false
    @State private var alert: ProductAlert?

    var body: some View {
        GroupBox {
            EmpleadoView(empleado: viewModel.empleado)
            ProductButton(title: "Agregar", systemImage: "person.badge.plus") {
                let result = viewModel.addEmpleado(context: modelContext)
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
