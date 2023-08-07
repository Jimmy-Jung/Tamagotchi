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
        self.font = Layout.Font.nameTitleFont
        self.textColor = Layout.Color.fontAndBorderColor
    }
    func shake(shakeText: String, textColor: UIColor = .red, durationTime: Double, willDisappear: Bool, completionHandler: @escaping () -> Void) {
        self.text = shakeText
        self.textColor = textColor
        self.shake()
        if willDisappear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.text = ""
                completionHandler()
            }
        }
    }
}

