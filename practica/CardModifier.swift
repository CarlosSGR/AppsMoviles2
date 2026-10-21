import SwiftUI

struct CardModifier: ViewModifier {
    var fondo: Color
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .background(fondo)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12).stroke(.red, lineWidth: 2)
            }.padding(.horizontal)
    }
}
