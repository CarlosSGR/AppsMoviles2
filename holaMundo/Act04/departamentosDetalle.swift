import SwiftUI

struct departamentosDetalle: View {
    let imagen: ImageResource
    let direccion: String
    let departamento: String
    let nombre: String
    let calificacion: CGFloat
    let precio: Int
    let superficie: CGFloat
    
    @Binding var estadoCorazon: Bool
    @Binding var estadoReserva: Bool
    
    let alPresionarCorazon: () -> Void
    
    var body: some View {
        VStack {
            Image(imagen)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .padding(.top, 0)
                .overlay {
                    ZStack {
                        Capsule()
                            .frame(width: 150, height: 50)
                            .opacity(0.5)
                            .overlay {
                                HStack {
                                    Image(systemName: "location")
                                    Text(direccion)
                                }.foregroundStyle(.white).padding()
                            }
                            .offset(x: -100, y: -100)
                        
                        Circle()
                            .frame(width: 50)
                            .opacity(0.5)
                            .overlay {
                                Button(action: {
                                    estadoCorazon.toggle()
                                    alPresionarCorazon()
                                }) {
                                    if estadoCorazon == false {
                                        Image(systemName: "heart")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .foregroundStyle(.white)
                                    } else {
                                        Image(systemName: "heart.fill")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .foregroundStyle(.white)
                                    }
                                }
                            }
                            .offset(x: 100, y: -100)
                        
                        HStack {
                            Button(action: {
                                estadoReserva.toggle()
                            }) {
                                if estadoReserva == false {
                                    Image(systemName: "house")
                                    Text("Reservar")
                                } else {
                                    Image(systemName: "xmark")
                                    Text("Cancelar")
                                }
                            }
                        }
                        .foregroundStyle(.white)
                        .padding()
                        .background(.blue)
                        .clipShape(Capsule())
                        .offset(y: 120)
                    }
                }
            
            HStack {
                Text(nombre).font(.headline)
                Spacer()
                Image(systemName: "star.fill").foregroundStyle(.yellow)
                Text(String(format: "%.1f", calificacion))
            }.padding(.vertical, 8)
            
            HStack {
                Text("$\(precio)").bold()
                Text("al mes")
                Spacer()
                Text(String(format: "%.1f", superficie)).foregroundStyle(.gray)
                Text("m2")
            }
        }.modifier(viewModifierDeptos())
    }
}
