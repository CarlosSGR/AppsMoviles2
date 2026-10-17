//
//  deptoVM.swift
//  examenParcial01
//
//  Created by win603 on 23/09/26.
//

import Foundation


struct deptoVM{
    func dummyData() -> [departamento] {
        let departamentos: [departamento] = [
            departamento(id: 1, imagen: .depa01,direccion: "Ampliación, Cd Madero", nombre: "GH Raíces | 1F", precio: 25000, superficie: 29.02, calificacion: 4.7),
            departamento(id: 2, imagen: .depa02,direccion: "Petrolera, Tampico", nombre: "Hmlet Raíces | 8F", precio: 14960, superficie: 26.15, calificacion: 0.0),
            departamento(id: 3, imagen: .depa03,direccion: "Miralta, Altamira", nombre: "Oak Century | 5F", precio: 16400, superficie: 25.08, calificacion: 4.7),
            departamento(id: 4, imagen: .depa04,direccion: "Los Mangos, Madero", nombre: "Fontana SH | 4F", precio: 17300, superficie: 27.22, calificacion: 4.6),
            departamento(id: 5, imagen: .depa05,direccion: "Grossman, Altamira", nombre: "Homestay Iest | 4F", precio: 18500, superficie: 25.74, calificacion: 5.0)
        ]

        return departamentos
    }
}
