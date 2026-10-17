//
//  ComidaModel.swift
//  Navegacion2
//

import Foundation

struct ProductoModel {
    let id: Int
    let nombre: String
    let imagen: String
    let precio: Float
}

struct CategoriaModel {
    let id: Int
    let nombre: String
    let icono: String
    let productos: [ProductoModel]
}
