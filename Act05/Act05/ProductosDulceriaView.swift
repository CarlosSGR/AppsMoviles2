//
//  ProductosDulceriaView.swift
//  Navegacion2
//

import SwiftUI
import AVFoundation //librería para reproducir multimedia

struct ProductosDulceriaView: View {
    let categoria: CategoriaModel

    @State private var player: AVAudioPlayer?
    @State var showAlert: Bool = false
    @State var seleccionado: String = ""

    var body: some View {
        ScrollView(){
            VStack{
                ForEach(categoria.productos, id: \.self.id){ producto in
                    ProductoDulceriaView(producto: producto) {
                        seleccionado = producto.nombre
                        showAlert = true
                    }
                }
            }
            .padding(.vertical)
        }
        .navigationTitle(categoria.nombre)
        .alert("¿Confirmar \(seleccionado)?", isPresented: $showAlert) {
            Button("Confirmar") {
                reproducirSonido()
            }
            Button("Cancelar") { }
        } message: {
            Text("Se agregará a tu pedido.")
        }
    }

    func reproducirSonido() {
        let nombreArchivo: String = "comer"
        let extensionArchivo: String = "mp3"
        guard let ubicacionSonido = Bundle.main.url(forResource: nombreArchivo, withExtension: extensionArchivo) else {
            print("No se encontró el archivo de sonido.Revisar este en el proyecto")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: ubicacionSonido)
            self.player?.play()
        } catch {
            print("Error al cargar el sonido: \(error)")
        }
    }
}

#Preview {
    NavigationStack {
        ProductosDulceriaView(categoria: DulceriaViewModel().getCategorias()[1])
    }
}
