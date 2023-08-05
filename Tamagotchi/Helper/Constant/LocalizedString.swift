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
    
    struct Main {
        static let status = "LV%d • %d • %d".localized
        static let feedingPlaceholder = "feedingPlaceholder".localized
        static let wateringPlaceholder = "wateringPlaceholder".localized
        static let feedingError = "feedingError".localized
        static let wateringError = "wateringError".localized
        static let numberError = "numberError".localized
        static let minusError = "minusError".localized
        static let feeding = "feeding".localized
        static let watering = "watering".localized
        
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
    
    struct Inspiration {
        static func getMessages() -> [String] {
            return [message0, message1, message2, message3, message4, message5]
        }
        static private let message0 = "InspirationMessage0".localized
        static private let message1 = "InspirationMessage1".localized
        static private let message2 = "InspirationMessage2".localized
        static private let message3 = "InspirationMessage3".localized
        static private let message4 = "InspirationMessage4".localized
        static private let message5 = "InspirationMessage5".localized
    }

    struct CannotEatMessage {
        static func getMessages() -> [String] {
            return messages.map {
                String(format: $0, UserDefaultManager.userName)
            }
        }
        static let messages = [message0, message1, message2, message3, message4]
        static private let message0 = "CannotEatMessage0 %@".localized
        static private let message1 = "CannotEatMessage1 %@".localized
        static private let message2 = "CannotEatMessage2 %@".localized
        static private let message3 = "CannotEatMessage3 %@".localized
        static private let message4 = "CannotEatMessage4 %@".localized
    }
}

