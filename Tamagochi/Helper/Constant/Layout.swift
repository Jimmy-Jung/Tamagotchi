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
        case changeTamagochi
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
    static let nameTitleFont = UIFont.systemFont(ofSize: 13, weight: .bold)
    /// 물먹기 버튼 이미지
    static let wateringButtonImage = UIImage(systemName: "drop.circle")
    /// 밥먹기 버튼 이미지
    static let feedignButtonImage = UIImage(systemName: "leaf.circle")
    
    /// 설정화면 이미지 가져오기
    /// - Parameter type: SettingType
    /// - Returns: UIImage
    static func getSettingButtonImage(with type: SettingType) -> UIImage {
        switch type {
        case .setName:
            return UIImage(systemName: "pencil")!
        case .changeTamagochi:
            return UIImage(systemName: "moon.fill")!
        case .resetData:
            return UIImage(systemName: "arrow.clockwise")!
        }
    }
    
    static func getTamagochiImage(with type: TamagochiType, level: Int) -> UIImage {
        switch type {
        case .sting:
            return UIImage(named: "1-\(level)")!
        case .smiling:
            return UIImage(named: "2-\(level)")!
        case .shinning:
            return UIImage(named: "3-\(level)")!
        }
    }

}
