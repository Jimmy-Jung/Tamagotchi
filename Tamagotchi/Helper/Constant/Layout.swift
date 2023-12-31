//
//  Constant.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import UIKit

typealias LT_Color = Layout.Color
typealias LT_Font = Layout.Font
typealias LT_Size = Layout.Size
typealias LT_Image = Layout.Image
typealias LT_Title = LocalizedString.Title
typealias LT_Main = LocalizedString.Main
typealias LT_System = LocalizedString.System
typealias LT_Inspiration = LocalizedString.Inspiration
typealias LT_CannotEatMessage = LocalizedString.CannotEatMessage

/// 레이아웃 Constant
enum Layout {
    /// 설정 화면 리스트
    enum SettingType {
        case setName
        case changeTamagotchi
        case resetData
    }
    enum Color {
        /// 네비게이션 타이틀 색상
        /// CGColor(red: 83/255, green: 105/255, blue: 118/255, alpha: 1)
        static let titleColor = UIColor(named: "titleColor")
        /// 배경색상
        /// CGColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        static let backgroundColor = UIColor(named: "backgroundColor")
        /// Popover 화면 배경색
        /// CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        static let seeThroughBackgroundColor = UIColor(named: "seeThroughBackgroundColor")
        /// 폰트/테두리 색상
        /// CGColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        static let fontAndBorderColor = UIColor(named: "fontAndBorderColor")
        /// 취소버튼 색상
        /// CGColor(red: 230/255, green: 237/255, blue: 239/255, alpha: 1)
        static let cancelBackgroundColor = UIColor(named: "cancelBackgroundColor")
        /// 구분선 색상
        /// CGColor(red: 148/255, green: 163/255, blue: 172/255, alpha: 1)
        static let separatorColor = UIColor(named: "separatorColor")

        
    }
    enum Size {
        /// 이름 백뷰 테두리 넓이
        static let backViewBorderWidth: CGFloat = 1
        /// 이름 백뷰 코너 크기
        static let backViewCornerRadius: CGFloat = 5
        /// 버튼 코너 크기
        static let buttonCornerRadius: CGFloat = 8
        
    }
    enum Font {
        /// 이름 레이블 폰트 ofSize: 12, weight: .bold
        static let nameTitleFont: UIFont = UIFont.systemFont(ofSize: 12, weight: .bold)
        /// 설명 레이블 폰트 ofSize: 14, weight: .medium
        static let descriptionFont = UIFont.systemFont(ofSize: 14, weight: .medium)
        /// 메인화면 이름 폰트 ofSize: 15, weight: .bold
        static let mainNameFont = UIFont.systemFont(ofSize: 15, weight: .bold)
        /// 버블 레이블 폰트 ofSize: 13, weight: .medium
        static let bubbleFont = UIFont.systemFont(ofSize: 13, weight: .medium)
        /// 에러 레이블 폰트 ofSize: 13, weight: .medium
        static let errorLabelFont = UIFont.systemFont(ofSize: 13, weight: .medium)
    }
    enum Image {
        /// 물먹기 버튼 이미지
        static let wateringButtonImage = UIImage(systemName: "drop.circle")
        /// 밥먹기 버튼 이미지
        static let feedingButtonImage = UIImage(systemName: "leaf.circle")
        
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
        static func getTamagotchiImage(type: TamagotchiType, level: Int) -> UIImage? {
            let safeLevel = level > 9 ? 9 : level
            switch type {
            case .sting:
                return UIImage(named: "1-\(safeLevel)") ?? UIImage(named: "noImage")
            case .smiling:
                return UIImage(named: "2-\(safeLevel)") ?? UIImage(named: "noImage")
            case .shinning:
                return UIImage(named: "3-\(safeLevel)") ?? UIImage(named: "noImage")
            case .none:
                return UIImage(named: "noImage")
            }
        }
    }
}
