import SwiftUI

struct PromoView: View {
    var titulo: String
    var descripcion: String
    var icono: String
    var color: Color
    var fondo: Color
    
    var body: some View {
        HStack {
            Image(systemName: icono).font(.largeTitle).foregroundStyle(color).frame(width: 60)
            VStack(alignment: .leading) {
                Text(titulo).font(.headline)
                Text(descripcion).font(.caption).foregroundStyle(.secondary)
            }
        }.modifier(CardModifier(fondo: fondo))
    }
}

#Preview {
    PromoView(titulo: "Promo prueba", descripcion: "Descripcion Prueba", icono: "star.fill", color: .orange, fondo: .red)
}
