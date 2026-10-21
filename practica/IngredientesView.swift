import SwiftUI

struct IngredientesView: View {
    var bebida: Bebida
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            HStack {
                Text("Ingredientes").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Button(action: {
                    dismiss()
                }){
                    Image(systemName: "xmark.circle.fill").font(.title).foregroundStyle(.gray)
                }
            }
            ForEach(bebida.ingredientes, id: \.self) {ingrediente in 
                Label(ingrediente, systemImage: "checkmark.circle")
            }
            
            Spacer()
        }.padding()
    }
}

#Preview {
    IngredientesView(bebida: BebidaVM().dummyData()[2])
}
