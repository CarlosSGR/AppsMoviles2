//
//  DetalleDepartamentoView.swift
//  Departamentos
//

import SwiftUI

struct DetalleDepartamentoView: View {

    var depa: Departamento
    @State var mostrarPlano: Bool = false

    var body: some View {
        Form {
            Section {
                Image(depa.imagen)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)

                Text(depa.ubicacion)
                    .font(.title)
                    .fontWeight(.bold)

                Text("$\(depa.precio) MXN / mes")
                    .foregroundColor(Color.secondary)
            }

            Section("Características") {
                ForEach(depa.caracteristicas, id: \.self.uuid) { caracteristica in
                    Label(caracteristica.nombre, systemImage: caracteristica.icono)
                }
            }

            Section {
                Button(action: {
                    self.mostrarPlano.toggle()
                }, label: {
                    Label("Ver plano y más fotos", systemImage: "photo.on.rectangle")
                })
            }
        }
        .navigationTitle("Detalles")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $mostrarPlano) {
            PlanoView(depa: depa)
        }
    }
}

#Preview {
    NavigationStack {
        DetalleDepartamentoView(depa: DepartamentoViewModel().dummyData()[0])
    }
}
