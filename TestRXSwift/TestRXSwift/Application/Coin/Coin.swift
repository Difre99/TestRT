//
//  Coin.swift
//  TestRXSwift
//
//  Created by Marco di Fresco on 19/04/22.
//

import Foundation

class Coin: Decodable{
    var id: String
    var name: String
//    var min_size: Float
    
    enum CodingKeys: String, CodingKeys{
        case id
        case name
//        case min_size
    }
    
    public required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
//        self.min_size = try container.decode(Float.self, forKey: .min_size)
    }
}
