//
//  LocalizedString.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/04.
//

import Foundation

typealias LS_Name = LocalizedString.Name
typealias LS_Description = LocalizedString.Description
typealias LS_Main = LocalizedString.Main
typealias LS_Title = LocalizedString.Title
typealias LS_System = LocalizedString.System
typealias LS_Inspiration = LocalizedString.Inspiration
typealias LS_CannotEatMessage = LocalizedString.CannotEatMessage
//typealias LS_ = LocalizedString.

enum LocalizedString {
    
    enum Name {
        static let sting = "stingTamago".localized
        static let smiling = "smilingTamago".localized
        static let shinning = "shinningTamago".localized
        static let none = "preparingTamago".localized
        static let userName = "userName".localized
    }
    enum Description {
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
    
    enum Main {
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
    
    enum Title {
        static let selectTamagotchi = "selectTamagotchi".localized
        static let changeTamagotchi = "changeTamagotchi".localized
        static let userTamagotchi = "userTamagotchi".localized
        static let changeUserName = "changeUserName%@".localized
        static let setting = "setting".localized
    }
    
    enum System {
        static let cancel = "cancel".localized
        static let start = "start".localized
        static let ok = "ok".localized
        static let no = "no".localized
        static let resetTitle = "resetTitle".localized
        static let resetMessage = "resetMessage".localized
        static let save = "save".localized
        static let numberOfTextError = "numberOfTextError".localized
        static let feedingAlert = "feedingAlert".localized
        static let feedingIdentifier = "FeedingIdentifier"
    }
    
    enum Inspiration {
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

    enum CannotEatMessage {
        static func getMessages() -> [String] {
            return messages.map {
                String(format: $0, UserDefaultManager.userName ?? Name.userName)
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

