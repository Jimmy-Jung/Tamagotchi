//
//  UIViewContreoller+Extension.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import UIKit.UIViewController


extension UIViewController {
    typealias Color = Layout.Color
    typealias Font = Layout.Font
    typealias Size = Layout.Size
    typealias Image = Layout.Image
    
    enum VCTitle {
        case selectTamagotchi
        case changeTamagotchi
        case userTamagotchi
        case setUserName
        case setting
    }
    
    /// Returns ViewController's Identifier String
    static var identifier: String {
        return String(describing: self)
    }
    
    ///  뷰컨트롤러 타이틀 설정
    /// - Parameter type: VCTitle
    func setTitle(type: VCTitle) {
        switch type {
        case .selectTamagotchi:
            self.title = LocalizedString.Title.selectTamagotchi
        case .changeTamagotchi:
            self.title = LocalizedString.Title.changeTamagotchi
        case .userTamagotchi:
            self.title = LocalizedString.Title.userTamagotchi
        case .setUserName:
            self.title = LocalizedString.Title.setUserName
        case .setting:
            self.title = LocalizedString.Title.setting
        }
    }
    

}


