//
//  TamagochiType.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import Foundation
enum TamagotchiType: Codable {
    case sting
    case smiling
    case shinning
    case none
}
struct TamagotchiInfo: Codable {
    var tamagotchiType: TamagotchiType
    let name: String
    var level: Int
    var feedingCount: Int
    var wateringCount: Int
    
    mutating func raiseFeedingCount(_ count: Int) {
        feedingCount += count
    }
    mutating func raiseWateringCount(_ count: Int) {
        wateringCount += count
    }
    mutating func raiseLevel() {
        level += 1
    }
    mutating func changeType(to type: TamagotchiType) {
        tamagotchiType = type
    }
    
}

