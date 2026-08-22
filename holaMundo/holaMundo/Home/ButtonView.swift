//
//  ButtonView.swift
//  holaMundo
//
//  Created by win603 on 17/08/26.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Text("Conoce las licenciaturas")
            .padding()
            .background(.orange)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .foregroundStyle(.white)
            .shadow(color: .yellow, radius: 12)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.black)
            .shadow(color: .colorPersonalizado1, radius: 12)
    }
}

#Preview {
    ButtonView()
}
