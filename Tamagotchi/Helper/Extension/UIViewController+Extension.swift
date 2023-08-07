//
//  UIViewContreoller+Extension.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import UIKit.UIViewController

extension UIViewController {

    enum VCTitle {
        case selectTamagotchi
        case changeTamagotchi
        case userTamagotchi
        case changeUserName
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
            self.title = LT_Title.selectTamagotchi
        case .changeTamagotchi:
            self.title = LT_Title.changeTamagotchi
        case .userTamagotchi:
            self.title = UM.userName + LT_Title.userTamagotchi
        case .changeUserName:
            self.title =  String(format: LT_Title.changeUserName, UM.userName)
        case .setting:
            self.title = LT_Title.setting
        }
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: LT_Color.titleColor ?? UIColor.label]
    }
    func setNavigationColor() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: LT_Color.titleColor ?? UIColor.label]
        view.backgroundColor = LT_Color.backgroundColor
    }

    
    func configBackBarButton(title: String) {
        let backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = LT_Color.fontAndBorderColor
        navigationItem.backBarButtonItem = backBarButtonItem
    }

    func showCancelAlert(
        title: String?,
        message: String?,
        preferredStyle: UIAlertController.Style,
        cancelTitle: String?,
        okTitle: String?,
        cancelHandler: ((UIAlertAction) -> Void)?,
        okHandler: ((UIAlertAction) -> Void)?
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler)
        let okAction = UIAlertAction(title: okTitle, style: .default, handler: okHandler)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

