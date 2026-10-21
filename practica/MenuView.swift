import SwiftUI

struct MenuView: View {
    @State var bebidas = BebidaVM().dummyData()
    @State var favorita: Int = 0
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(bebidas) {bebida in
                    NavigationLink(destination: DetalleView(bebida: bebida, favorita: $favorita), label: {
                        BebidaRowView(bebida: bebida, esFavorita: favorita == bebida.id) 
                    })
                }
                .onDelete {indexSet in
                    bebidas.remove(atOffsets: indexSet)    
                }
            }.listStyle(PlainListStyle()).navigationTitle("Menú")
        }
        
    }
}

#Preview {
    MenuView()
}
