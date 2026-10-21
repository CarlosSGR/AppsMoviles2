import SwiftUI
import Foundation

struct Bebida: Identifiable {
    let id: Int
    let nombre: String
    let icono: String
    let precio: Float
    let descripcion: String
    let ingredientes: [String]
    let ventas: Int
    let color: Color
}

