//
//  ContentView.swift
//  Departamentos
//

import SwiftUI

struct ContentView: View {

    let departamentos = DepartamentoViewModel().dummyData()

    @State var todosFavoritos: Bool = false
    @State var reservado: Int = 0

    var body: some View {
        NavigationStack {
            VStack {
                Toggle("Marcar todos como favoritos", isOn: $todosFavoritos)
                    .padding(.horizontal)

                if todosFavoritos {
                    GroupBox() {
                        Text("Todos han sido marcados")
                    }
                    .padding(.horizontal)
                }

                ScrollView() {
                    ForEach(departamentos) { depa in
                        DepartamentoView(depa: depa, todosFavoritos: $todosFavoritos, reservado: $reservado)
                    }
                }
            }
            .navigationTitle("Departamentos")
        }
    }
}

#Preview {
    ContentView()
}
