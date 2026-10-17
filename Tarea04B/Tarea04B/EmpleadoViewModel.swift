//
//  EmpleadoViewModel.swift
//  DatosApp
//

import Foundation
import SwiftData
import Observation

@Observable class EmpleadoViewModel {
    var empleado: Empleado
    var searchText = ""

    init() {
        empleado = Empleado(nombre: "", sueldo: 0.0, faltas: 0)
    }

    func exampleEmpleado() -> Empleado {
        Empleado(nombre: "Juan Pérez", sueldo: 12000, faltas: 2)
    }

    func filteredEmpleados(from empleados: [Empleado]) -> [Empleado] {
        let search = searchText
            .trimmingCharacters(in: .whitespacesAndNewlines)
        guard !search.isEmpty else { return empleados }
        return empleados.filter {
            $0.nombre.localizedCaseInsensitiveContains(search)
        }
    }

    private func validateEmpleado(_ empleado: Empleado)
        -> (nombre: String, sueldo: Decimal, faltas: Int)? {
        let nombre = empleado.nombre
            .trimmingCharacters(in: .whitespacesAndNewlines)
        guard !nombre.isEmpty,
              empleado.sueldo >= 0,
              empleado.faltas >= 0
        else {
            return nil
        }
        return (nombre: nombre, sueldo: empleado.sueldo, faltas: empleado.faltas)
    }

    func addEmpleado(context: ModelContext) -> ProductOperationResult {
        guard let data = validateEmpleado(empleado)
        else {
            return .invalidData
        }
        let newEmpleado = Empleado(
            nombre: data.nombre,
            sueldo: data.sueldo,
            faltas: data.faltas
        )
        context.insert(newEmpleado)
        do {
            try context.save()
            empleado.nombre = ""
            empleado.sueldo = 0.0
            empleado.faltas = 0
            return .success
        } catch {
            return .saveError
        }
    }

    func updateEmpleado(
        targetEmpleado: Empleado,
        from draftEmpleado: Empleado,
        context: ModelContext
    ) -> ProductOperationResult {
        // 1. Validar la información del empleado borrador
        guard let validatedData = validateEmpleado(draftEmpleado) else {
            return .invalidData
        }
        // 2. Aplicar los cambios validados al empleado real
        targetEmpleado.nombre = validatedData.nombre
        targetEmpleado.sueldo = validatedData.sueldo
        targetEmpleado.faltas = validatedData.faltas
        // 3. Guardar en el contexto de SwiftData
        do {
            try context.save()
            return .success
        } catch {
            return .saveError
        }
    }

    func deleteEmpleado(
        offsets: IndexSet,
        empleados: [Empleado],
        context: ModelContext
    ) -> ProductOperationResult {
        for index in offsets {
            guard empleados.indices.contains(index) else { continue }
            context.delete(empleados[index])
        }
        do {
            try context.save()
            return .success
        } catch {
            return .saveError
        }
    }

    func alert(for result: ProductOperationResult) -> ProductAlert {
        switch result {
        case .success:
            return ProductAlert(
                title: "Operación exitosa",
                message: "Los cambios se guardaron correctamente.")
        case .invalidData:
            return ProductAlert(
                title: "Datos inválidos",
                message: "El nombre del empleado no puede estar vacío y el sueldo y las faltas no pueden ser menores que 0.")
        case .saveError:
            return ProductAlert(
                title: "Error",
                message: "No se pudieron guardar los cambios.")
        }
    }
}
