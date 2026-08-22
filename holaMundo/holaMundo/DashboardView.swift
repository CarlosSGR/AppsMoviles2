//
//  DashboardView.swift
//  holaMundo
//
//  Created by win603 on 07/08/26.
//

import SwiftUI

struct DashboardView: View {
    let asistente: String = "Hola, soy Finn tu asistente virtual para nuevo ingreso al IEST Anáhuac. ¿Cómo te puedo ayudar? 😁"
    var body: some View {
        /*
         Column: VStack
         Row: HStack
         Box: ZStack
         */
        
            ZStack{
                VStack{
                    
                    Text(asistente)
                        .padding()
                        .background(
                            Color.gray.opacity(0.5)
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        .padding(5)
                        .multilineTextAlignment(.center)
                    HStack(alignment: .top){
                        Text("""
                     Curso 
                     iOs
                     """)
                        .padding()
                        .border(Color.purple, width: 1)
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .rotationEffect(.degrees(45))
                        
                        Spacer()
                        
                        Text("Solicita información")
                            .padding()
                            .background(.orange)
                            .foregroundStyle(.white)
                            .bold()
                            .rotationEffect(.degrees(-90))
                        
                        
                        
                    }
                    .padding(4)
                    .offset(y:60)
                    Spacer()
                    
                    DegreesView()
                    
                    AdView()

                    ButtonView()
                    
                }
                ChatBubbleView().offset(x: -8)
            }
        
        

        
    }
}

#Preview {
    DashboardView()
}
