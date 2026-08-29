//
//  FoodListView.swift
//  holaMundo
//
//  Created by win603 on 26/08/26.
//

import SwiftUI

struct FoodListView: View {
    @State var selectAll: Bool = false
    @State var bgGeneral: Color = .white
    var body: some View {
        ScrollView(){
            HStack{
            
                
                Button( action: {
                    selectAll.toggle()
                    if selectAll {
                        bgGeneral = .yellow
                    }else{
                        bgGeneral = .white
                    }
                }){
                    Text("Selecciona todo")
                }
            }
            
            VStack{
                FoodView(name: "Hamburguesa", image: "🍔", bg: $bgGeneral)
                FoodView(name: "Pollo", image: "🍗", bg: $bgGeneral)
            }
        }
    }
}

#Preview {
    FoodListView()
}
