//
//  BPriceIndex.swift
//  BitcoinPriceIndexDisplay
//
//  Created by Nana Adwoa Odeibea Amoah on 7/10/21.
//

import Foundation

class BPriceIndex: Codable {
    var time = ""
    var disclaimer = ""
    
    enum CodingKeys: String, CodingKey{
        case time
        case disclaimer
    }
}
