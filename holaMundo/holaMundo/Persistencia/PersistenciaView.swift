//
//  PersistenciaView.swift
//  holaMundo
//
//  Created by win603 on 05/10/26.
//

import SwiftUI

struct PersistenciaView: View {
    var contable: ContadorClass = ContadorClass()
    var body: some View {
        TabView {
            Tab("Inicio", systemImage: "house") {
                ContadorView(contable: contable)
            }
            Tab("Final Dea", systemImage: "person.fill") {
                ProfileView()
            }
        }
    }
}

#Preview {
    PersistenciaView()
}

