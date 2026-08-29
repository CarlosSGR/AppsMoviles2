//
//  McDonaldViewModifier.swift
//  holaMundo
//
//  Created by win603 on 26/08/26.
//

import SwiftUI

struct McDonaldViewModifier: ViewModifier {
    var borderColor: Color = .blue
    var background: Color = .gray.opacity(0.2)
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(borderColor))
    }
}


