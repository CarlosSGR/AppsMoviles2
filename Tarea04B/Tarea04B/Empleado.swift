//
//  Empleado.swift
//  DatosApp
//

import Foundation
import SwiftData

@Model
final class Empleado {
    var nombre: String
    var sueldo: Decimal
    var faltas: Int

    init(nombre: String, sueldo: Decimal, faltas: Int) {
        self.nombre = nombre
        self.sueldo = sueldo
        self.faltas = faltas
    }
}
