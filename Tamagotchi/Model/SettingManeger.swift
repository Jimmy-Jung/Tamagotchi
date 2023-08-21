//
//  SegueType.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit

final class SettingManager {
    
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
                title: String(format: LT_Title.changeUserName, UM.userName),
                icon: UIImage(systemName: "pencil"),
                secondaryText: UM.userName,
                handler: { [weak self] in
                    let sb = UIStoryboard(name: "Main", bundle: nil)
                    let vc = sb.instantiateViewController(identifier: ChangeNameViewController.identifier) as! ChangeNameViewController
                    vc.setTitle(type: .changeUserName)
                    self?.delegate?.navigationController?.pushViewController(vc, animated: true)
                }),
            SettingsOption(
                title: LT_Title.changeTamagotchi,
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
                title: LT_System.resetTitle,
                icon: UIImage(systemName: "arrow.clockwise"),
                secondaryText: nil,
                handler: { [weak self] in
                    HapticsManager.shared.vibrateForNotification(type: .warning)
                    self?.delegate?.showCancelAlert(
                        title: LT_System.resetTitle,
                        message: LT_System.resetMessage,
                        preferredStyle: .alert,
                        cancelTitle: LT_System.no,
                        okTitle: LT_System.ok,
                        cancelHandler: { _ in
                            HapticsManager.shared.vibrateForSelection()
                            
                        },
                        okHandler: { _ in
                            HapticsManager.shared.vibrateForSelection()
                            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                            let sceneDelegate = windowScene?.delegate as? SceneDelegate
                            let sb = UIStoryboard(name: "Main", bundle: nil)
                            let vc = sb.instantiateViewController(identifier: SelectionViewController.identifier) as! SelectionViewController
                            UM.userName = LS_Name.userName
                            vc.setTitle(type: .selectTamagotchi)
                            let nav = UINavigationController(rootViewController: vc)
                            UM.pickedTamagotchi = nil
                            sceneDelegate?.window?.rootViewController = nav
                            sceneDelegate?.window?.makeKeyAndVisible()
                        }
                    )
                }
            ),
            SettingsOption(
                title: LT_System.feedingAlert,
                icon: UIImage(systemName: "clock"),
                secondaryText: dateFormatter(date: UM.feedingAlert),
                handler: { [weak self] in
                let vc = AlertPickerViewController()
                self?.delegate?.navigationController?.pushViewController(vc, animated: true)
            }
            )
        ]
    }
    
    private func dateFormatter(date: Date?) -> String? {
        guard let selectedTime = date else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: selectedTime)
    }
}
