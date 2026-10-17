//
//  DulceriaViewModel.swift
//  Navegacion2
//

import Foundation

struct DulceriaViewModel {

    func getCategorias() -> [CategoriaModel] {

        let categorias = [

            CategoriaModel(id: 1, nombre: "Palomitas", icono: "popcorn.fill", productos: [
                ProductoModel(id: 1, nombre: "Palomitas chicas", imagen: "palomitas", precio: 75.00),
                ProductoModel(id: 2, nombre: "Palomitas grandes", imagen: "palomitas", precio: 110.00),
                ProductoModel(id: 3, nombre: "Palomitas de caramelo", imagen: "palomitasCaramelo", precio: 125.00)
            ]),

            CategoriaModel(id: 2, nombre: "Bebidas", icono: "cup.and.saucer.fill", productos: [
                ProductoModel(id: 4, nombre: "Refresco mediano", imagen: "refresco", precio: 70.00),
                ProductoModel(id: 5, nombre: "Refresco grande", imagen: "refresco", precio: 85.00),
                ProductoModel(id: 6, nombre: "Agua natural", imagen: "agua", precio: 40.00)
            ]),

            CategoriaModel(id: 3, nombre: "Snacks", icono: "fork.knife", productos: [
                ProductoModel(id: 7, nombre: "Nachos con queso", imagen: "nachos", precio: 90.00),
                ProductoModel(id: 8, nombre: "Hot dog", imagen: "hotdog", precio: 80.00),
                ProductoModel(id: 9, nombre: "Papas a la francesa", imagen: "papas", precio: 75.00)
            ]),

            CategoriaModel(id: 4, nombre: "Dulces", icono: "star.fill", productos: [
                ProductoModel(id: 10, nombre: "Chocolate", imagen: "chocolate", precio: 45.00),
                ProductoModel(id: 11, nombre: "Gomitas", imagen: "gomitas", precio: 50.00),
                ProductoModel(id: 12, nombre: "ICEE", imagen: "icee", precio: 95.00)
            ])
        ]
        return categorias
    }
}
