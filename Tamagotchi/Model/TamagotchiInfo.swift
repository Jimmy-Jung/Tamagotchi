//
//  TamagochiType.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import Foundation
enum TamagotchiType: String {
    case sting
    case smiling
    case shinning
    case none
}
struct TamagotchiInfo {
    let tamagotchiType: TamagotchiType
    let name: String
    let level: Int
    let feedingCount: Int
    let wateringCount: Int
}

