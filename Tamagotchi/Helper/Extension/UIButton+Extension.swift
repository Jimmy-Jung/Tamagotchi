//
//  UIButton+Extension.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit

extension UIButton {
    enum ButtonActionType {
        case cancel
        case defaults
    }
    /// PlainButton 구성하기
    /// - Parameters:
    ///   - title: 타이틀
    ///   - fontSize: 폰트 사이즈
    ///   - weight: 두께
    /// - Returns: UIButton.Configuration
    static func plainButtonConfig(
        title: String,
        titleColor: UIColor = UIColor.label,
        ofSize fontSize: CGFloat,
        weight: UIFont.Weight
    ) -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        var titleAtt = AttributedString.init(title)
        titleAtt.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        titleAtt.foregroundColor = titleColor
        config.attributedTitle = titleAtt
        return config
    }
    
    static func imageButtonConfig(
        title: String,
        ofSize fontSize: CGFloat,
        weight: UIFont.Weight,
        systemName: String
    ) -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        var titleAtt = AttributedString.init(title)
        titleAtt.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        config.attributedTitle = titleAtt
        config.image = UIImage(systemName: systemName)
        config.preferredSymbolConfigurationForImage = .init(pointSize: fontSize)
        config.imagePadding = 3
        config.background.backgroundColor = LT_Color.backgroundColor
        config.contentInsets = .zero
        return config
    }
    func layoutButton(
        tintColor: UIColor,
        borderColor: CGColor,
        borderWidth: CGFloat,
        cornerRadius: CGFloat
    ) {
        self.tintColor = LT_Color.fontAndBorderColor
        self.layer.borderColor = LT_Color.fontAndBorderColor?.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
    
    func defaultButtonSetting(borderWidth: CGFloat, cornerRadius: CGFloat) {
        self.layer.borderColor = LT_Color.fontAndBorderColor?.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.backgroundColor = LT_Color.backgroundColor
    }
    
    /// 버튼 클릭시 배경색 변화 애니메이션 및 햅틱반응
    /// - Parameters:
    ///   - button: 적용 할 버튼
    ///   - type: ButtonActionType
    static func buttonTapEffect(button: UIButton, type: ButtonActionType) {
        HapticsManager.shared.vibrateForSelection()
        
        let BGColor: UIColor? = {
            switch type {
            case .cancel:
                return LT_Color.cancelBackgroundColor
            case .defaults:
                return LT_Color.backgroundColor
            }}()
        
        UIView.transition(
            with: button,
            duration: 0.3,
            options: [.curveEaseIn ]
        ) {
            button.backgroundColor = .lightGray
        }
        UIView.transition(
            with: button,
            duration: 0.3,
            options: [.curveEaseOut]
        ) {
            button.backgroundColor = BGColor
        }
    }
}

