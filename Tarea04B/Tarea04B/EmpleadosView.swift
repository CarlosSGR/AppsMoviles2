//
//  EmpleadosView.swift
//  DatosApp
//

import SwiftUI
import SwiftData

struct EmpleadosView: View {
    @State private var viewModel = EmpleadoViewModel()
    @Query private var empleados: [Empleado]

    var body: some View {
        NavigationSplitView {
            VStack {
                AddEmpleadoView(viewModel: viewModel)
                EmpleadoListView(empleados: empleados, viewModel: viewModel)
            }
            .padding()
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer, prompt: "Buscar empleado")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .navigationTitle("Empleados")
        } detail: {
            Text("Selecciona un Empleado")
        }
    }
}
