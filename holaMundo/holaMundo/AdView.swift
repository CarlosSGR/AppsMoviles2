//
//  AdView.swift
//  holaMundo
//
//  Created by win603 on 17/08/26.
//

import SwiftUI

struct AdView: View {
    
    var body: some View {
        Image(.licenciaturaIestPhotoIndex215Zjs).resizable().aspectRatio(contentMode: .fit)
        
            .overlay(
                VStack{
                    Spacer()
                    Text("¿Ya sabes que licenciatura estudiar?").font(.title2).padding(.bottom)
                    Text("Todas las licenciaturas y ventajas de estudiar en Tampuerco"
                    )
                }.foregroundStyle(.white).frame(maxWidth: .infinity, maxHeight: .infinity).padding(.bottom).background(.black.opacity(0.5))
                    
            ).padding(.horizontal)
    }
}

#Preview {
    AdView()
}
