//
//  ChatBubbleView.swift
//  holaMundo
//
//  Created by win603 on 12/08/26.
//

import SwiftUI

struct ChatBubbleView: View {
    
    
    var body: some View {
        //command shift L para ver los iconos
        VStack{
            Spacer()
            HStack{
                Spacer()
                
                VStack{
                    
                    Image(systemName:"bubble")
                        .font(.largeTitle)
                    Text("Chat")
                    
                }.foregroundStyle(.white)
                    .padding()
                    .background(.orange)
                    .clipShape(.circle)
            }
        }
    }
}

#Preview {
    ChatBubbleView()
}
