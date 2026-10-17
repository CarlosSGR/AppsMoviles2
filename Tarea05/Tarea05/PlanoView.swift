//
//  PlanoView.swift
//  Departamentos
//

import SwiftUI

struct PlanoView: View {

    var depa: Departamento
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView() {
            VStack(spacing: 20) {

                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                    })
                }

                Text("Plano del departamento")
                    .font(.title2)
                    .fontWeight(.bold)

                Image(depa.plano)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)

                Text("Más fotos")
                    .font(.title2)
                    .fontWeight(.bold)

                ForEach(depa.fotos, id: \.self) { foto in
                    Image(foto)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
    }
}

#Preview {
    PlanoView(depa: DepartamentoViewModel().dummyData()[0])
}
