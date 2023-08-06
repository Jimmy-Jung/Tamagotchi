//
//  Logic.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/06.
//

import UIKit

final class LogicManager {

    typealias Main = LocalizedString.Main
    typealias Inspiration = LocalizedString.Inspiration
    typealias CannotEatMessage = LocalizedString.CannotEatMessage
    typealias UM = UserDefaultManager
    
    static let feedingConstraint: Int = 99
    static let wateringConstraint: Int = 49
    
    var delegate: MainViewController?
    
    func feedingLogic(
        numString: String,
        label: UILabel,
        textField: UITextField,
        bubbleLabel: UILabel,
        tag: Int,
        constraint: Int
    ) {
        if numString.isEmpty {
            if tag == 0 {
                UM.pickedTamagotchi?.raiseFeedingCount(1)
            } else {
                UM.pickedTamagotchi?.raiseWateringCount(1)
            }
            delegate?.changedValue = UM.pickedTamagotchi!
            return
        }
        guard let count = Int(numString) else {
            textField.text = " "
            label.text = Main.numberError
            label.textColor = .systemRed
            label.shake()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                label.text = ""
                textField.text = ""
            }
            return
        }
        
        switch count {
        case let count where count > constraint:
            bubbleLabel.text = CannotEatMessage.getMessages().randomElement()
            textField.text = " "
            if tag == 0 {
                label.text = Main.feedingError
            } else {
                label.text = Main.wateringError
            }
            label.textColor = .systemRed
            label.shake()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                label.text = ""
                textField.text = ""
            }
        case 0...constraint:
            bubbleLabel.text = Inspiration.getMessages().randomElement()
            if tag == 0 {
                UM.pickedTamagotchi?.raiseFeedingCount(count)
            } else {
                UM.pickedTamagotchi?.raiseWateringCount(count)
            }
            delegate?.changedValue = UM.pickedTamagotchi!
        case let count where count < 0:
            textField.text = " "
            label.text = Main.minusError
            label.textColor = .systemRed
            label.shake()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                label.text = ""
                textField.text = ""
            }
        default:
            break
        }
    }
}
