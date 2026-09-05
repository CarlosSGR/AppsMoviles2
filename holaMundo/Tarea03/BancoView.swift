//
//  BancoView.swift
//  holaMundo
//
//  Created by win603 on 04/09/26.
//

import SwiftUI

struct BancoView: View {
    var body: some View {
        VStack{
            HStack{
                Text("SG")
                Text("Hola, Sebastián")
                Spacer()
                Image(systemName: "bell")
                HStack{
                    Image(systemName: "message.badge")
                    Text("Ayuda")
                }.padding(10).background(.azulClaro).clipShape(.capsule)
            }
            
            Text("Saldo disponible")
            Text("$1,000,000.00").font(.system(size: 45))
            HStack{
                Text("🔥 15%").padding(5).background(.green).clipShape(.capsule)
                Text("Tu dinero está creciendo")
                Image(systemName: "arrow.right")
            }.padding().background(.azulFuerte).clipShape(.capsule)
            
            HStack{
                VStack{
                    Circle().frame(width: 60).overlay{
                        Image(systemName: "plus")
                    }
                    Text("Depositar")
                }
                
                VStack{
                    Circle().frame(width: 60).overlay{
                        Image(systemName: "arrow.right")
                    }
                    Text("Transferir")
                }
                
                VStack{
                    Circle().frame(width: 60)
                    Text("Retirar")
                }
                
                VStack{
                    Circle().frame(width: 60)
                    Text("Tu CLABE")
                }
            }
            
        }.padding()
        Spacer()
    }
}

#Preview {
    BancoView()
}
