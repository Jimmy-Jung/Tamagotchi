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
    func shake(
        shakeText: String,
        textColor: UIColor = .red,
        durationTime: Double,
        textWillDisappear: Bool,
        prepareHandler: (() -> Void)? = nil,
        completionHandler: (() -> Void)? = nil
    ) {
        prepareHandler?()
        self.text = shakeText
        self.textColor = textColor
        self.shake()
        HapticsManager.shared.vibrateForNotification(type: .error)
        if textWillDisappear {
            DispatchQueue.main.asyncAfter(deadline: .now() + durationTime) {
                self.text = ""
                completionHandler?()
            }
        }
    }
}

