//
//  UserDefault.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import Foundation

@propertyWrapper
/// 유저 디퐅트
struct UserDefault<T> {
    private let key: String
    private let defaultValue: T
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct UserDefaultManager {
    typealias tamagoName = LocalizedString.Name
    @UserDefault(
        key: KeyEnum.tamagotchiList.rawValue,
        defaultValue: [
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
            )])
    static var tamagotchiList: [TamagotchiInfo]
    
    enum KeyEnum: String {
        case tamagotchiList
    }
}
