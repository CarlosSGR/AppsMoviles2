//
//  Pokemon.swift
//  MyApp
//
//  Created by win603 on 14/10/26.
//

import Foundation

struct Pokemon: Decodable{
    let count: Int
    let next: String
    let previous: String?
    let results: [Results]

    struct Results: Decodable,Identifiable,Hashable{
        let name: String
        let url: String
        
        var id:String { url }
    }
}
