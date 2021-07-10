//
//  BPriceIndex.swift
//  BitcoinPriceIndexDisplay
//
//  Created by Nana Adwoa Odeibea Amoah on 7/10/21.
//

import Foundation

class BPriceIndex: Codable {
    var name = ""
    var price = Float()
    
    enum CodingKeys: String, CodingKey{
        case name
        case price 
    }
}
