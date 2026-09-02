//
//  ShapesView.swift
//  holaMundo
//
//  Created by win603 on 02/09/26.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        VStack{
            Circle().fill(.blue).frame(height: 100).overlay(){
                Capsule().fill(.blue).frame(width: 150, height: 50)
            }
            Circle().fill(.green).frame(height: 100).overlay(){
                Rectangle().fill(.white).frame(width: 30, height: 30)
            }
            Circle().fill(.blue).frame(height: 100).overlay(){
                Circle().fill(.green).frame(width: 50, height: 50)
                Circle().fill(.yellow).frame(width: 25, height: 25)
                Circle().fill(.red).frame(width: 10, height: 10)
            }
            Circle().stroke(.black).frame(height:100).overlay(){
                Rectangle().fill(.red).frame(width: 25, height: 70)
                Rectangle().fill(.red).frame(width: 25, height: 70).rotationEffect(Angle(degrees: 90))
            }
            
        }
    }
}

#Preview {
    ShapesView()
}
