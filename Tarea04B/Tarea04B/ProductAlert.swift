//
//  ProductAlert.swift
//  DatosApp
//
//  Se usan tanto para Productos como para Empleados.
//

struct ProductAlert {
    let title: String
    let message: String
}

enum ProductOperationResult {
    case success
    case invalidData
    case saveError
}
