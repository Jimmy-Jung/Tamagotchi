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

@propertyWrapper
/// 유저 디퐅트 커스텀 타입
struct UserDefaultCustomType<T: Codable> {
    private let key: String
    private let defaultValue: T?
    
    init(key: String, defaultValue: T?) {
        self.key = key
        self.defaultValue = defaultValue
    }
    var wrappedValue: T? {
        get {
            let userDefaultObject = UserDefaults.standard.object(forKey: key)
            if let savedData = userDefaultObject as? Data,
               let loadedObject = try? PropertyListDecoder()
                .decode(T.self, from: savedData) {
                return loadedObject
            } else {
                // 실패시 한번 더 디코딩 시도
                if let savedData = userDefaultObject as? Data,
                   let loadedObject = try? PropertyListDecoder()
                    .decode(T.self, from: savedData) {
                    return loadedObject
                } else { return defaultValue }
            }
        }
        set {
            if let encoded = try? PropertyListEncoder().encode(newValue) {
                UserDefaults.standard.setValue(encoded, forKey: key)
            } else {
                // 실패시 한번 더 인코딩 시도
                let encoded = try? PropertyListEncoder().encode(newValue)
                UserDefaults.standard.setValue(encoded, forKey: key)
            }
        }
    }
}

typealias UM = UserDefaultManager

struct UserDefaultManager {
    
    @UserDefault(key: KeyEnum.userName.rawValue, defaultValue: "대장")
    static var userName: String
    
    @UserDefaultCustomType(key: KeyEnum.pickedTamagotchi.rawValue, defaultValue: nil)
    static var pickedTamagotchi: TamagotchiInfo?
    
    @UserDefault(key: KeyEnum.feedingAlert.rawValue, defaultValue: nil)
    static var feedingAlert: Date?
    
    enum KeyEnum: String {
        case userName
        case pickedTamagotchi
        case feedingAlert
    }
}
