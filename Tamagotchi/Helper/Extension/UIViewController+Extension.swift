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
    typealias Title = LocalizedString.Title
    typealias Main = LocalizedString.Main
    typealias Inspiration = LocalizedString.Inspiration
    typealias CannotEatMessage = LocalizedString.CannotEatMessage
    typealias UM = UserDefaultManager
    
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
            self.title = Title.selectTamagotchi
        case .changeTamagotchi:
            self.title = Title.changeTamagotchi
        case .userTamagotchi:
            self.title = UM.userName + Title.userTamagotchi
        case .setUserName:
            self.title = UM.userName + Title.setUserName
        case .setting:
            self.title = Title.setting
        }
    }
    
    func setTitleColor() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Color.titleColor]
    }

}

