//
//  FoodView.swift
//  holaMundo
//
//  Created by win603 on 26/08/26.
//

import SwiftUI

struct FoodView: View {
    @State var name:String
    @State var image: String
    @Binding var bg: Color
    @State var selected: Bool = false
    var body: some View {
        VStack{
            Image(image).resizable()
                .frame(width: 50, height: 50)
            Text(name)
        }
        .modifier(McDonaldViewModifier(background: bg))
        .onTapGesture {
            selected.toggle()
            if selected {
                bg = .red
            } else {
                bg = .white
            }
        }
    }
}

#Preview {
    FoodView(name: "Papas", image: "🍟", bg: .constant(.white))
}
