//
//  viewModifierDeptos.swift
//  holaMundo
//
//  Created by win603 on 28/09/26.
//

import SwiftUI

struct viewModifierDeptos: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.1), radius: 5, x:0, y:2)
    }
}

#Preview {
    //viewModifierDeptos()
}
