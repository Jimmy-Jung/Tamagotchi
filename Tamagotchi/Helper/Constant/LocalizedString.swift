//
//  LocalizedString.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/04.
//

import Foundation

struct LocalizedString {
    struct Tamagotchi {
        struct Name {
            static let sting = "stingTamago".localized
            static let smiling = "smilingTamago".localized
            static let shinning = "shinningTamago".localized
            static let none = "preparingTamago".localized
        }
        struct Description {
            static let sting = "stingDescription".localized
            static let smiling = "smilingDescription".localized
            static let shinning = "shinningDescription".localized
        }
    }
    struct System {
        static let cancel = "cancel".localized
        static let start = "start".localized
    }
}
