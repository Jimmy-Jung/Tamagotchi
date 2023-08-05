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
    let tamagotchiType: TamagotchiType
    let name: String
    let level: Int
    let feedingCount: Int
    let wateringCount: Int
}

