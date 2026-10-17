//
//  ContentView.swift
//  DatosApp
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Productos", systemImage: "cart") {
                ProductosView()
            }
            Tab("Empleados", systemImage: "person.3") {
                EmpleadosView()
            }
        }
    }
}
