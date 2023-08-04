//
//  TamagochiType.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import Foundation
enum TamagochiType: String {
    case sting
    case smiling
    case shinning
}
struct TamagochiInfo {
    let tamagochiType: TamagochiType
    let name: String
    let level: Int
    let feedingCount: Int
    let wateringCount: Int
}

