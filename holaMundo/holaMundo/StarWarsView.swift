//
//  StarWarsView.swift
//  holaMundo
//
//  Created by win603 on 14/08/26.
//

import SwiftUI

struct StarWarsView: View {
    var colorAmarillo = Color(.yellow)
    let titulo1: String = String(localized:"Episode III")
    let titulo2:String = String(localized:"Revenge of the Sith")
    let textoInicial =
    """
    Episode III
REVENGE OF THE SITH
War! The Republic crumbles
under the attacks of the ruthless
Sith Lord, Count Dooku.
There are heroes on both sides.
Evil is everywhere.
In a stunning move, the
evil droid leader, General
Grievous, has swept into the
Republic capital and kidnapped
Chancellor Palpatine, the leader
of the Galactic Senate.

As the Separatist droid army
attempts to flee the besieged
capital with their valuable
hostage, two Jedi Knights lead a
desperate mission to rescue the
captive Chancellor…
"""
    
    var body: some View {
        VStack{
            Text(titulo1).foregroundStyle(colorAmarillo).fontWeight(.bold).font(.custom("starjedi", size: 28))
            Text(titulo2).foregroundStyle(colorAmarillo).fontWeight(.bold).font(.custom("starjedi", size: 28))
            
            Spacer()
        
            VStack{
                Text(textoInicial).foregroundStyle(colorAmarillo).fontWeight(.semibold).font(.custom("starjedi", size: 28)).offset(y: -150)
                    Spacer()
            }.rotation3DEffect(.degrees(45),
                               axis: (x: 1.0, y: 0.0, z: 0.0),
                               anchor: .center,
                               anchorZ: 0,
                               perspective: 1)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.black)
    
    }
        
}

#Preview {
    StarWarsView()
}
