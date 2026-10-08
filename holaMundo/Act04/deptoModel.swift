//
//  deptoModel.swift
//  holaMundo
//
//  Created by win603 on 28/09/26.
//

import Foundation
import SwiftUI

struct departamento : Identifiable {
    let uuid: UUID = UUID()
    let id: Int
    let imagen: ImageResource
    let direccion: String
    let nombre: String
    let precio: Int
    let superficie: CGFloat
    let calificacion: CGFloat
    var estadoCorazon: Bool = false
}
