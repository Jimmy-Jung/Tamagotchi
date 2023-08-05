//
//  Constant.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import UIKit

struct Layout {
    /// 설정 화면 리스트
    enum SettingType {
        case setName
        case changeTamagotchi
        case resetData
    }
    /// 배경색상
    static let backgroundColor = UIColor(cgColor: .init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1))
    /// 폰트/테두리 색상
    static let fontAndBorderColor = CGColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    /// 이름 백뷰 테두리 넓이
    static let backViewBorderWidth: CGFloat = 1
    /// 이름 백뷰 코너 크기
    static let backViewCornerRadius: CGFloat = 5
    /// 이름 레이블 폰트
    static let nameTitleFont = UIFont.systemFont(ofSize: 12, weight: .bold)
    /// 설명 레이블 폰트
    static let descriptionFont = UIFont.systemFont(ofSize: 14, weight: .medium)
    /// 물먹기 버튼 이미지
    static let wateringButtonImage = UIImage(systemName: "drop.circle")
    /// 밥먹기 버튼 이미지
    static let feedingButtonImage = UIImage(systemName: "leaf.circle")
    /// 취소버튼 색상
    static let cancelBackgroundColor = CGColor(red: 230/255, green: 237/255, blue: 239/255, alpha: 1)
    
    /// 설정화면 이미지 가져오기
    /// - Parameter type: SettingType
    /// - Returns: UIImage
    static func getSettingButtonImage(type: SettingType) -> UIImage {
        switch type {
        case .setName:
            return UIImage(systemName: "pencil")!
        case .changeTamagotchi:
            return UIImage(systemName: "moon.fill")!
        case .resetData:
            return UIImage(systemName: "arrow.clockwise")!
        }
    }
    
    /// 다마고치 이미지 가져오기
    /// - Parameters:
    ///   - type: TamagotchiType
    ///   - level: level
    /// - Returns: UIImage
    static func getTamagochiImage(type: TamagotchiType, level: Int) -> UIImage {
        switch type {
        case .sting:
            return UIImage(named: "1-\(level)")!
        case .smiling:
            return UIImage(named: "2-\(level)")!
        case .shinning:
            return UIImage(named: "3-\(level)")!
        case .none:
            return UIImage(named: "noImage")!
        }
    }
    
    /// 다마고치 설명 가져오기
    /// - Parameter type: TamagotchiType
    /// - Returns: Localized String
    static func getDescription(type: TamagotchiType) -> String {
        switch type {
        case .sting:
            return LocalizedString.Tamagotchi.Description.sting
        case .smiling:
            return LocalizedString.Tamagotchi.Description.smiling
        case .shinning:
            return LocalizedString.Tamagotchi.Description.shinning
        case .none:
            return ""
        }
    }

}
