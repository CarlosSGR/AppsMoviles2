import SwiftUI

struct InicioView: View {
    let nombreCafeteria: String = "Cafe IEST"
    let colorPrincipal: Color = Color(.orange)
    let horario: String = "Abierto de 7:00 a 15:00"
    let urlBanner = "https://picsum.photos/600/300"
    @State var likes: Int = 0
    @State var presionado: Bool = false
    @AppStorage("nombreCliente") private var nombreGuardado = ""
    @State private var nombre = ""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("¿Como te llamas?", text: $nombre).textFieldStyle(.roundedBorder).padding(.horizontal)
                
                Button(action: {
                    nombreGuardado = nombre
                }){
                    Text("Guardar")
                }.buttonStyle(.borderedProminent)
                    .tint(.green)
                
                Text("Bienvenido \(nombreGuardado)").font(.title2)
                
                
                ZStack{
                    Circle().fill(colorPrincipal).frame(width: 120, height: 120)
                    Image(systemName: "cup.and.saucer.fill").font(.system(size: 50)).foregroundStyle(.white)
                }.padding(.top)
                Text(nombreCafeteria).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(colorPrincipal)
                Text(horario).font(.caption).foregroundStyle(.red)
                Text("Abierto").font(.caption).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green).padding(.horizontal,20).padding(.vertical, 6).overlay {
                    Capsule().stroke(.green, lineWidth: 2)
                }
                Text("Nuevo").font(.caption).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.red).padding(.horizontal,20).padding(.vertical, 6).overlay {
                    Capsule().stroke(.red, style: StrokeStyle(lineWidth: 2, dash: [5]))
                }
    
                AsyncImage(url: URL(string: urlBanner)) { estadoImagen in
                    switch estadoImagen {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable().aspectRatio(contentMode: .fit).cornerRadius(15).overlay(alignment: .topTrailing){
                            Text("¡Prueba nuestro cafe de olla!").font(.headline).padding(8).foregroundStyle(.white).background(.black).cornerRadius(8).padding()
                        }
                    case .failure:
                        Image(systemName: "wifi.slash").font(.largeTitle).foregroundStyle(.red)
                        
                    default:
                        EmptyView()
                    }
                }.padding(.horizontal)
                
                Button(action: {
                    withAnimation() {
                        likes += 1
                        presionado.toggle()
                    }
                }){
                   HStack {
                       Image(systemName: "heart.fill").scaleEffect(presionado ? 1.5 : 1).rotationEffect(presionado ? .degrees(20): .degrees(0))
                       Text("Me gusta: \(likes)")
                   }.padding().foregroundStyle(.white).background(.pink).cornerRadius(30)
                }
                
                Button(action: {
                    withAnimation(.spring()) {
                        likes = 0
                    }
                }){
                    HStack {
                        Image(systemName: "trash.fill")
                        Text("Reiniciar Likes")
                    }.padding().foregroundStyle(.white).background(.black).cornerRadius(30)
                }
            }
            Text("Promociones").font(.title2).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            PromoView(titulo: "2x1 lattes", descripcion: "Todos los lunes", icono: "cup.and.saucer.fill", color: .brown, fondo: .red)
            PromoView(titulo: "Combo desayuno", descripcion: "Cafe + pan por $45", icono: "takeoutbag.and.cup.and.straw.fill", color: .orange, fondo: .blue)
            PromoView(titulo: "Tarjeta de Lealtad", descripcion: "El 10° Cafe es gratis", icono: "star.fill", color: .yellow, fondo: .black)
        }
        
    }
}

#Preview {
    InicioView()
}
