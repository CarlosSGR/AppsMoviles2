//
//  DepartamentoView.swift
//  Departamentos
//

import SwiftUI

struct DepartamentoView: View {

    var depa: Departamento
    @Binding var todosFavoritos: Bool
    @Binding var reservado: Int

    @State var favorito: Bool = false
    @State var showAlert: Bool = false

    var body: some View {
        VStack(alignment: .leading) {

            Image(depa.imagen)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12)

            HStack {
                VStack(alignment: .leading) {
                    Text(depa.ubicacion)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("$\(depa.precio) MXN / mes")
                        .foregroundColor(Color.secondary)
                }

                Spacer()

                // Favorito individual: solo este botón muestra la alerta
                Button(action: {
                    withAnimation() {
                        self.favorito.toggle()
                    }
                    if favorito {
                        showAlert = true
                    }
                }, label: {
                    Image(systemName: (favorito || todosFavoritos) ? "heart.fill" : "heart")
                        .font(.title)
                        .foregroundColor(.red)
                })
            }

            // Solo un departamento reservado a la vez gracias al Binding
            Button(action: {
                withAnimation() {
                    self.reservado = depa.id
                }
            }, label: {
                Text(reservado == depa.id ? "Reservado" : "Reservar")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(reservado == depa.id ? Color.green : Color.blue)
                    .cornerRadius(8)
            })

            // Botón que navega a la pantalla de características
            NavigationLink(destination: DetalleDepartamentoView(depa: depa), label: {
                Label("Ver características", systemImage: "list.bullet")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .foregroundColor(.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue, lineWidth: 2)
                    )
            })
        }
        .modifier(CardViewModifier())
        .alert(Text("Departamento de \(depa.ubicacion) ha sido establecido como preferido exitosamente"), isPresented: $showAlert) {

        }
    }
}
