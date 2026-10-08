import SwiftUI

struct infoAlerta: Identifiable {
    let id = UUID()
    let direccion: String
}

struct deptosView: View {
    @State var dptoVM = deptoVM().dummyData()
    @State var departamentoReservadoID: Int? = nil
    @State var datosAlerta: infoAlerta? = nil
    
    var todosMarcados: Bool {
        !dptoVM.isEmpty && dptoVM.allSatisfy { $0.estadoCorazon }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Departamentos").font(.title)
                Spacer()
            }
            .padding(.horizontal)
            
            Toggle("Marcar todos como favoritos", isOn: Binding(
                get: { todosMarcados },
                set: { nuevoValor in
                    for index in dptoVM.indices {
                        dptoVM[index].estadoCorazon = nuevoValor
                    }
                }
            ))
            .padding(.horizontal)
            
            if todosMarcados {
                GroupBox {
                    Text("Todos han sido marcados")
                        .font(.headline)
                        .foregroundStyle(.green)
                }
                .padding(.horizontal)
            }
            
            List {
                ForEach($dptoVM) { $dpto in
                    departamentosDetalle(
                        imagen: dpto.imagen,
                        direccion: dpto.direccion,
                        departamento: "caca",
                        nombre: dpto.nombre,
                        calificacion: dpto.calificacion,
                        precio: dpto.precio,
                        superficie: dpto.superficie,
                        estadoCorazon: $dpto.estadoCorazon,
                        estadoReserva: Binding(
                            get: { departamentoReservadoID == dpto.id },
                            set: { isSelected in
                                if isSelected {
                                    departamentoReservadoID = dpto.id
                                } else {
                                    if departamentoReservadoID == dpto.id {
                                        departamentoReservadoID = nil
                                    }
                                }
                            }
                        ),
                        alPresionarCorazon: {
                            if dpto.estadoCorazon {
                                datosAlerta = infoAlerta(direccion: dpto.direccion)
                            }
                        }
                    )
                }
            }
            Spacer()
        }
        .alert(item: $datosAlerta) { alerta in
            Alert(
                title: Text("Preferencia Actualizada"),
                message: Text("Departamento de \(alerta.direccion) ha sido establecido como preferido exitosamente"),
                dismissButton: .default(Text("Aceptar"))
            )
        }
    }
}

#Preview {
    deptosView()
}
