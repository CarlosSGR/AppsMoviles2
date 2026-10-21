import SwiftUI
import AVFoundation

struct DetalleView: View {
    var bebida: Bebida
    @Environment(\.dismiss) var dismiss
    @Binding var favorita: Int
    
    @State var mostrarIngredientes: Bool = false
    @State var mostrarAlerta: Bool = false
    @State private var player: AVAudioPlayer?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Image(systemName: bebida.icono).font(.system(size: 100)).foregroundStyle(bebida.color).padding()
                
                Text(bebida.nombre).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text("$" + String(bebida.precio) + " MXN").font(.title2)
                
                Text(bebida.descripcion).foregroundStyle(.secondary).modifier(CardModifier(fondo: .orange))
                
                Button(action: {
                    withAnimation(){
                        favorita = bebida.id
                    }
                }){
                    Label(favorita == bebida.id ? "Es tu favorita" : "Marcar como favorita", systemImage: favorita == bebida.id ? "star.fill" : "star").padding().foregroundStyle(.white).background(favorita == bebida.id ? .yellow : .gray).cornerRadius(10)
                }
                
                Button(action: {
                    mostrarIngredientes = true
                }){
                    Text("Ver Ingredientes")
                }.buttonStyle(.borderedProminent).tint(.gray)
            }
        }.navigationTitle(bebida.nombre).navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden(true).toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.backward.circle.fill").foregroundStyle(.purple)
                }
            }
            
        }
        .sheet(isPresented: $mostrarIngredientes) {
            IngredientesView(bebida: bebida)
        }
        .alert("¿Ordenar \(bebida.nombre)?", isPresented: $mostrarAlerta) {
            Button(action: {
                reproducirSonido()
            }){
                Text("Confirmar")
            }
            
            Button(action: {
                
            }){
                Text("Cancelar")
            }
        } message: {
            Text("Total: $" + String(bebida.precio) + " MXN")
        }
    }
    
    func reproducirSonido() {
        let nombreArchivo: String = "ordenar"
        let extensionArchivo: String = "mp3"
        guard let ubicacionSonido = Bundle.main.url(forResource: nombreArchivo, withExtension: extensionArchivo) else {
            print("No se encontro el archivo de sonido")
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


