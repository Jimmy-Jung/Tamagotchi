//
//  DefaultsTamagotchiList.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/05.
//

import Foundation

struct DefaultsTamagotchiList {
    typealias tamagoName = LS_Name
    static let defaultTamagotchiList = [
        TamagotchiInfo(
            tamagotchiType: .sting,
            name: tamagoName.sting,
            level: 1,
            feedingCount: 0,
            wateringCount: 0
        ),
        TamagotchiInfo(
            tamagotchiType: .smiling,
            name: tamagoName.smiling,
            level: 1,
            feedingCount: 0,
            wateringCount: 0
        ),
        TamagotchiInfo(
            tamagotchiType: .shinning,
            name: tamagoName.shinning,
            level: 1,
            feedingCount: 0,
            wateringCount: 0
        )]
}
