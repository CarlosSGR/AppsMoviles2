//
//  EmpleadoView.swift
//  DatosApp
//

import SwiftUI

struct EmpleadoView: View {
    @Bindable var empleado: Empleado

    var body: some View {
        VStack {
            TextField("Nombre", text: $empleado.nombre)
            TextField("Sueldo", value: $empleado.sueldo, format: .number)
                .keyboardType(.decimalPad)
            TextField("Faltas", value: $empleado.faltas, format: .number)
                .keyboardType(.numberPad)
        }
    }
}

#Preview {
    EmpleadoView(empleado: EmpleadoViewModel().exampleEmpleado())
}
