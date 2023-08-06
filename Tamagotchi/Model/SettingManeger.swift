//
//  SegueType.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit

final class SettingManager {
    typealias Setting = LocalizedString.Setting
    typealias Title = LocalizedString.Title
    typealias System = LocalizedString.System
    typealias Color = Layout.Color
    typealias UM = UserDefaultManager
    
    struct SettingsOption {
        let title : String
        let icon : UIImage?
        let secondaryText : String?
        let handler : (() -> Void)
    }
    
    weak var delegate: SettingViewController?
    
    lazy var settingList: [SettingsOption] = [
        SettingsOption(
            title: Setting.changeUserName,
            icon: UIImage(systemName: "pencil"),
            secondaryText: UM.userName,
            handler: { [weak self] in
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateViewController(identifier: ChangeNameViewController.identifier) as! ChangeNameViewController
                vc.setTitle(type: .changeUserName)
                self?.delegate?.navigationController?.pushViewController(vc, animated: true)
            }),
        SettingsOption(
            title: Setting.changeTamagotchi,
            icon: UIImage(systemName: "moon.fill"),
            secondaryText: nil,
            handler: { [weak self] in
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateViewController(identifier: SelectionViewController.identifier) as! SelectionViewController
                vc.setTitle(type: .changeTamagotchi)
                self?.delegate?.navigationController?.pushViewController(vc, animated: true)
            }
        ),
        SettingsOption(
            title: Setting.reset,
            icon: UIImage(systemName: "arrow.clockwise"),
            secondaryText: nil,
            handler: { [weak self] in
                self?.delegate?.showCancelAlert(
                    title: System.resetTitle,
                    message: System.resetMessage,
                    preferredStyle: .alert,
                    cancelTitle: System.no,
                    okTitle: System.ok,
                    cancelHandler: nil,
                    okHandler: { [weak self] _ in
                        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                        let sceneDelegate = windowScene?.delegate as? SceneDelegate
                        let sb = UIStoryboard(name: "Main", bundle: nil)
                        let vc = sb.instantiateViewController(identifier: SelectionViewController.identifier) as! SelectionViewController
                        vc.setTitle(type: .changeTamagotchi)
                        let nav = UINavigationController(rootViewController: vc)
                        sceneDelegate?.window?.rootViewController = nav
                        sceneDelegate?.window?.makeKeyAndVisible()
                    }
                )
            }
        )]
    
}
