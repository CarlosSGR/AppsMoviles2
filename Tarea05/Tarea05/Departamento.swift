//
//  Departamento.swift
//  Departamentos
//

import Foundation

struct Caracteristica {
    let uuid = UUID()
    let nombre: String
    let icono: String
}

struct Departamento: Identifiable {
    let id: Int
    let ubicacion: String
    let precio: Int
    let imagen: String
    let caracteristicas: [Caracteristica]
    let plano: String
    let fotos: [String]
}
