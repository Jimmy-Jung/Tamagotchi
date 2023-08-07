//
//  HapticManager.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit

/// 햅틱 매니저
final class HapticsManager {
    /// 싱글톤
    static let shared = HapticsManager()
    
    private init() {}
    
    // MARK: - Public
    
    /// 선택시 얇은 진동 피드백
    func vibrateForSelection() {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }
    /// 알림 진동 피드백
    func vibrateForNotification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }

}
