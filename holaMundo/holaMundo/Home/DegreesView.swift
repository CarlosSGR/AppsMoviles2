//
//  DegreesView.swift
//  holaMundo
//
//  Created by win603 on 17/08/26.
//

import SwiftUI

struct DegreesView: View {
    var body: some View {
        HStack{
            VStack{
                Text("17 Licenciaturas").padding(.vertical)
                Text("Conoce nuestra oferta académica y elige el programa perfecto para ti.").font(.caption)
            }
            
            Divider().frame(width: 2, height: 80).background(.green)
            
            VStack{
                Text("16 Maestrías").padding(.vertical)
                Text("Excelencia académica y la preparación que requieres para tu desarrollo profesional.").font(.caption)
            }
        }.frame(maxWidth: .infinity).padding().background(.black).foregroundStyle(.white)
    }
}

#Preview {
    DegreesView()
}
