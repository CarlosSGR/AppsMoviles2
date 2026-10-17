//
//  EditEmpleadoView.swift
//  DatosApp
//

import SwiftUI
import SwiftData

struct EditEmpleadoView: View {
    let item: Empleado

    @State private var viewModel = EmpleadoViewModel()
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    // Borrador temporal (no está en el context de SwiftData)
    @State private var draftEmpleado = Empleado(nombre: "", sueldo: 0.0, faltas: 0)

    @State private var showAlert = false
    @State private var alert: ProductAlert?

    var body: some View {
        Form {
            Section("Empleado") {
                EmpleadoView(empleado: draftEmpleado)
                ProductButton(title: "Guardar", systemImage: "pencil") {
                    let result = viewModel.updateEmpleado(
                        targetEmpleado: item,
                        from: draftEmpleado,
                        context: modelContext)
                    alert = viewModel.alert(for: result)
                    showAlert = true
                }
            }
        }
        .navigationTitle("Editar empleado")
        .onAppear {
            draftEmpleado.nombre = item.nombre
            draftEmpleado.sueldo = item.sueldo
            draftEmpleado.faltas = item.faltas
        }
        .alert(alert?.title ?? "", isPresented: $showAlert) {
            Button("OK") {
                if alert?.title == "Operación exitosa" {
                    dismiss()
                }
            }
        } message: {
            Text(alert?.message ?? "")
        }
    }
}
