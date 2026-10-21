import SwiftUI

struct BebidaRowView: View{
    var bebida: Bebida
    var esFavorita: Bool
    
    var body: some View {
        HStack {
            Image(systemName: bebida.icono).font(.title).foregroundStyle(bebida.color).frame(width: 50)
            
            VStack(alignment: .leading) {
                Text(bebida.nombre).font(.headline)
                Text("$" + String(bebida.precio) + " MXN").font(.caption)
            }
            
            Spacer()
            
            if esFavorita {
                Image(systemName: "star.fill").foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    BebidaRowView(bebida: BebidaVM().dummyData()[0], esFavorita: true)
}
