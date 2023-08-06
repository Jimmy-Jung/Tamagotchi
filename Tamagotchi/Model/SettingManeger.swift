//
//  SegueType.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit

final class SettingManager {
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
    private var settingList: [SettingsOption] = []
    
    var getList: [SettingsOption] {
        get { return settingList }
    }
    func SetList() {
        settingList = [
            SettingsOption(
                title: UM.userName + Title.changeUserName,
                icon: UIImage(systemName: "pencil"),
                secondaryText: UM.userName,
                handler: { [weak self] in
                    let sb = UIStoryboard(name: "Main", bundle: nil)
                    let vc = sb.instantiateViewController(identifier: ChangeNameViewController.identifier) as! ChangeNameViewController
                    vc.setTitle(type: .changeUserName)
                    self?.delegate?.navigationController?.pushViewController(vc, animated: true)
                }),
            SettingsOption(
                title: Title.changeTamagotchi,
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
                title: System.resetTitle,
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
                        okHandler: { _ in
                            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                            let sceneDelegate = windowScene?.delegate as? SceneDelegate
                            let sb = UIStoryboard(name: "Main", bundle: nil)
                            let vc = sb.instantiateViewController(identifier: SelectionViewController.identifier) as! SelectionViewController
                            vc.setTitle(type: .changeTamagotchi)
                            let nav = UINavigationController(rootViewController: vc)
                            UM.pickedTamagotchi = nil
                            sceneDelegate?.window?.rootViewController = nav
                            sceneDelegate?.window?.makeKeyAndVisible()
                        }
                    )
                }
            )
        ]
    }
    
}
