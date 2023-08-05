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
    
    //로그인 오류시 글씨 흔들기
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.08
        shake.repeatCount = 2
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(shake, forKey: "position")
    }
}
