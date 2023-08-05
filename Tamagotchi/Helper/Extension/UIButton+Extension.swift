//
//  UIButton+Extension.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit.UIButton

extension UIButton {
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
}

