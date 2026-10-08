//
//  ContadorClass.swift
//  holaMundo
//
//  Created by win603 on 07/10/26.
//

import Foundation

@MainActor
@Observable final class ContadorClass {
    var contador: Int = 0
    var number = 0
    
    private var task: Task<Void, Never>?
    
    func start() {
        guard task == nil else {return}
        
        task = Task {
            while !Task.isCancelled {
                try? await Task.sleep(for:
                        .seconds(2))
                guard !Task.isCancelled else {break}
                number += 1
            }
        }
    }
    
    func stop(){
        task?.cancel()
        task = nil
    }
    
    func aumentar(){
        contador += 1
    }
    
    func disminuir(){
        contador -= 1
    }
}
