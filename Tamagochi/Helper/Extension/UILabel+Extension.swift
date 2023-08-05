//
//  UILabel+Extension.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit.UILabel

extension UILabel {
    /// 타이틀 색상컬러 & 폰트 크기
    func defaultLabelSetting() {
        self.font = Layout.nameTitleFont
        self.textColor = UIColor(cgColor: Layout.fontAndBorderColor)
    }
}

