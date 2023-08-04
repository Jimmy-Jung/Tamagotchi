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
    typealias tamagoName = LocalizedString.TamagochiName
    @UserDefault(
        key: KeyEnum.tamagochiList.rawValue,
        defaultValue: [
            TamagochiInfo(
                tamagochiType: .sting,
                name: tamagoName.sting,
                level: 1,
                feedingCount: 0,
                wateringCount: 0
            ),
            TamagochiInfo(
                tamagochiType: .smiling,
                name: tamagoName.smiling,
                level: 1,
                feedingCount: 0,
                wateringCount: 0
            ),
            TamagochiInfo(
                tamagochiType: .shinning,
                name: tamagoName.shinning,
                level: 1,
                feedingCount: 0,
                wateringCount: 0
            )])
    static var tamagochiList: [TamagochiInfo]
    
    enum KeyEnum: String {
        case tamagochiList
    }
}
