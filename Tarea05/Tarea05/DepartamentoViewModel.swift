//
//  DepartamentoViewModel.swift
//  Departamentos
//

import Foundation

struct DepartamentoViewModel {

    func dummyData() -> [Departamento] {

        let departamentos: [Departamento] = [
            Departamento(id: 1, ubicacion: "Tampico Centro", precio: 8500, imagen: "depa1",
                         caracteristicas: [
                            Caracteristica(nombre: "Wi-Fi", icono: "wifi"),
                            Caracteristica(nombre: "Aire acondicionado", icono: "air.conditioner.horizontal"),
                            Caracteristica(nombre: "Cama matrimonial", icono: "bed.double"),
                            Caracteristica(nombre: "Refrigerador", icono: "refrigerator"),
                            Caracteristica(nombre: "Elevador", icono: "arrow.up.arrow.down.square")
                         ],
                         plano: "plano1", fotos: ["depa1_a", "depa1_b"]),

            Departamento(id: 2, ubicacion: "Ciudad Madero", precio: 7200, imagen: "depa2",
                         caracteristicas: [
                            Caracteristica(nombre: "Wi-Fi", icono: "wifi"),
                            Caracteristica(nombre: "Cocina equipada", icono: "frying.pan"),
                            Caracteristica(nombre: "Microondas", icono: "microwave"),
                            Caracteristica(nombre: "Estacionamiento", icono: "car"),
                            Caracteristica(nombre: "Lavadora", icono: "washer")
                         ],
                         plano: "plano2", fotos: ["depa2_a", "depa2_b"]),

            Departamento(id: 3, ubicacion: "Altamira", precio: 6000, imagen: "depa3",
                         caracteristicas: [
                            Caracteristica(nombre: "Ventilador de techo", icono: "fan.ceiling"),
                            Caracteristica(nombre: "Cama individual", icono: "bed.double"),
                            Caracteristica(nombre: "Estacionamiento para bicicletas", icono: "bicycle"),
                            Caracteristica(nombre: "Recolección de basura", icono: "trash"),
                            Caracteristica(nombre: "Cerradura electrónica", icono: "lock")
                         ],
                         plano: "plano3", fotos: ["depa3_a", "depa3_b"]),

            Departamento(id: 4, ubicacion: "Colonia Petrolera", precio: 9800, imagen: "depa4",
                         caracteristicas: [
                            Caracteristica(nombre: "Wi-Fi", icono: "wifi"),
                            Caracteristica(nombre: "Aire acondicionado", icono: "air.conditioner.horizontal"),
                            Caracteristica(nombre: "Toallas y blancos", icono: "square.stack.3d.up"),
                            Caracteristica(nombre: "Aspiradora", icono: "fan"),
                            Caracteristica(nombre: "Pet friendly", icono: "pawprint")
                         ],
                         plano: "plano4", fotos: ["depa4_a", "depa4_b"]),

            Departamento(id: 5, ubicacion: "Playa Miramar", precio: 12500, imagen: "depa5",
                         caracteristicas: [
                            Caracteristica(nombre: "Vista al mar", icono: "water.waves"),
                            Caracteristica(nombre: "Alberca", icono: "figure.pool.swim"),
                            Caracteristica(nombre: "Aire acondicionado", icono: "air.conditioner.horizontal"),
                            Caracteristica(nombre: "Cocina equipada", icono: "frying.pan"),
                            Caracteristica(nombre: "Seguridad 24 horas", icono: "shield")
                         ],
                         plano: "plano5", fotos: ["depa5_a", "depa5_b"])
        ]

        return departamentos
    }
}
