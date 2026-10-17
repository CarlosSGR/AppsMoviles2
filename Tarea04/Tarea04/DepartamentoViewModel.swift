//
//  DepartamentoViewModel.swift
//  Departamentos
//

import Foundation

struct DepartamentoViewModel {

    func dummyData() -> [Departamento] {

        let departamentos: [Departamento] = [
            Departamento(id: 1, ubicacion: "Tampico Centro", precio: 8500, imagen: "depa1"),

            Departamento(id: 2, ubicacion: "Ciudad Madero", precio: 7200, imagen: "depa2"),

            Departamento(id: 3, ubicacion: "Altamira", precio: 6000, imagen: "depa3"),

            Departamento(id: 4, ubicacion: "Colonia Petrolera", precio: 9800, imagen: "depa4"),

            Departamento(id: 5, ubicacion: "Playa Miramar", precio: 12500, imagen: "depa5")
        ]

        return departamentos
    }
}
