//
//  Logic.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/06.
//

import UIKit

final class LogicManager {
    
    static let feedingConstraint: Int = 99
    static let wateringConstraint: Int = 49
    
    var delegate: LogicProtocol?
    
    /// 먹이 주면 레멜업, 유저디폴트 갱신
    /// - Parameters:
    ///   - FC: feedingCount
    ///   - WC: wateringCount
    ///   - type: TamagotchiType
    func levelUp(feedingCount FC: Int, wateringCount WC: Int, type: TamagotchiType) {
        let floatCount = Float(FC)/5 + Float(WC)/2
        let count = Int(floatCount / 10)
        var level = 0
        var imageName = ""
        
        switch type {
        case .sting:
            imageName = "1-"
        case .smiling:
            imageName = "2-"
        case .shinning:
            imageName = "3-"
        case .none:
            return
        }
        
        switch count {
        case 0...1:
            imageName += "1"
            level = 1
        case 2...9:
            imageName += "\(count)"
            level = count
        default:
            imageName += "9"
            level = 10
        }
        
        delegate?.setTamagotchiImage(imageName: imageName)
        UM.pickedTamagotchi?.setLevel(level: level)
        guard let changedValue = UM.pickedTamagotchi else {return}
        let status = String(
            format: LT_Main.status,
            changedValue.level,
            changedValue.feedingCount,
            changedValue.wateringCount
        )
        delegate?.setStatusLabel(text: status)
    }
    
    /// 먹이 주는 로직
    /// - Parameters:
    ///   - numString: 텍스트필드 숫자
    ///   - label: 에러메세지 띄울 레이블
    ///   - textField: 입력할 텍스트필드
    ///   - bubbleLabel: 이야기 표시할 버블 레이블
    ///   - tag: 탭한 버튼 태그
    ///   - constraint: 먹이 제약
    func feedingLogic(
        numString: String,
        label: UILabel,
        textField: UITextField,
        bubbleLabel: UILabel,
        tag: Int
    ) {
        do {
            let constraint = tag == 0 ? Self.feedingConstraint : Self.wateringConstraint
            guard !numString.isEmpty else {
                changeFeedingWateringCount(tag: tag)
                return
            }
            let count = try checkNumber(numString: numString)
            try checkCount(count: count, constraint: constraint)
            fetchChangedValue(count: count, tag: tag)
            
        } catch {
            switch error as! FeedingError {
            case .isNotNumber:
                label.shake(
                    shakeText: LT_Main.numberError,
                    durationTime: 2,
                    textWillDisappear: true,
                    prepareHandler: { textField.text = " " },
                    completionHandler: { textField.text = "" }
                )
            case .tooMuch:
                delegate?.setBubbleLabel(text: LT_CannotEatMessage.getMessages().randomElement())
                label.shake(
                    shakeText: tag == 0 ? LT_Main.feedingError : LT_Main.wateringError,
                    durationTime: 2,
                    textWillDisappear: true,
                    prepareHandler: { textField.text = " " },
                    completionHandler: { textField.text = "" }
                )
            case .minusNumber:
                label.shake(
                    shakeText: LT_Main.minusError,
                    durationTime: 2,
                    textWillDisappear: true,
                    prepareHandler: { textField.text = " " },
                    completionHandler: { textField.text = "" }
                )
            }
        }
    }
    
    private func changeFeedingWateringCount(tag: Int) {
        if tag == 0 {
            UM.pickedTamagotchi?.raiseFeedingCount(1)
        } else {
            UM.pickedTamagotchi?.raiseWateringCount(1)
        }
        delegate?.setChangedValue(tamagotchi: UM.pickedTamagotchi)
    }
    
    
    private func checkNumber(numString: String) throws -> Int {
        guard let count = Int(numString) else {
            throw FeedingError.isNotNumber
        }
        return count
    }
    
    private func checkCount(count: Int, constraint: Int) throws {
        if count > constraint {
            throw FeedingError.tooMuch
        } else if count < 0 {
            throw FeedingError.minusNumber
        }
    }
    
    private func fetchChangedValue(count: Int, tag: Int) {
        delegate?.setBubbleLabel(text: LT_Inspiration.getMessages().randomElement())
        if tag == 0 {
            UM.pickedTamagotchi?.raiseFeedingCount(count)
        } else {
            UM.pickedTamagotchi?.raiseWateringCount(count)
        }
        delegate?.setChangedValue(tamagotchi: UM.pickedTamagotchi)
    }
}
