//
//  LocalizedString.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/04.
//

import Foundation

struct LocalizedString {
    
    struct Name {
        static let sting = "stingTamago".localized
        static let smiling = "smilingTamago".localized
        static let shinning = "shinningTamago".localized
        static let none = "preparingTamago".localized
        
    }
    struct Description {
        static private let sting = "stingDescription".localized
        static private let smiling = "smilingDescription".localized
        static private let shinning = "shinningDescription".localized
        static private let none = "preparingDescription".localized
        
        /// 다마고치 설명 가져오기
        /// - Parameter type: TamagotchiType
        /// - Returns: Localized String
        static func getDescription(type: TamagotchiType) -> String {
            switch type {
            case .sting:
                return sting
            case .smiling:
                return smiling
            case .shinning:
                return shinning
            case .none:
                return none
            }
        }
    }
    struct Title {
        static let selectTamagotchi = "selectTamagotchi".localized
        static let changeTamagotchi = "changeTamagotchi".localized
        static let userTamagotchi = "userTamagotchi".localized
        static let setUserName = "setUserName".localized
        static let setting = "setting".localized
    }
    
    struct System {
        static let cancel = "cancel".localized
        static let start = "start".localized
    }
}
