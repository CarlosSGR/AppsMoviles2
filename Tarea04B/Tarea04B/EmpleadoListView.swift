//
//  EmpleadoListView.swift
//  DatosApp
//

import SwiftUI
import SwiftData

struct EmpleadoListView: View {
    let empleados: [Empleado]
    var viewModel: EmpleadoViewModel
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        List {
            ForEach(viewModel.filteredEmpleados(from: empleados)) { empleado in
                NavigationLink(
                    destination: EditEmpleadoView(item: empleado)
                ) {
                    VStack(alignment: .leading) {
                        Text(empleado.nombre)
                            .font(.headline)
                        Text("Sueldo: $\(empleado.sueldo)   Faltas: \(empleado.faltas)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .onDelete { offsets in
                let filteredEmpleados =
                    viewModel.filteredEmpleados(from: empleados)
                viewModel.deleteEmpleado(offsets: offsets,
                                         empleados: filteredEmpleados,
                                         context: modelContext)
            }
        }
    }
}
