//
//  UIView+extension.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit.UIView

extension UIView {
    /// 타이틀 백뷰 테두리 & 코너 & 배경색
    func defaultViewSetting() {
        self.layer.borderColor = Layout.Color.fontAndBorderColor
        self.layer.borderWidth = Layout.Size.backViewBorderWidth
        self.layer.cornerRadius = Layout.Size.backViewCornerRadius
        self.clipsToBounds = true
        self.backgroundColor = UIColor(cgColor: Layout.Color.backgroundColor)
    }
}
