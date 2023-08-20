//
//  AlertPickerVIewController.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/20.
//

import UIKit
import SnapKit

final class AlertPickerViewController: UIViewController {
    private let timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        return picker
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.text = "알람 시간"
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        
        button.layoutButton(
            tintColor: LT_Color.fontAndBorderColor ?? UIColor.label,
            borderColor: LT_Color.fontAndBorderColor?.cgColor ?? UIColor.label.cgColor,
            borderWidth: LT_Size.backViewBorderWidth,
            cornerRadius: LT_Size.buttonCornerRadius)
        button.configuration = UIButton.plainButtonConfig(title: "설정하기", ofSize: 14, weight: .bold)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = LT_Color.backgroundColor
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(timePicker)
        stackView.addArrangedSubview(button)
        
        let inset: CGFloat = 20
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(inset)
            make.trailing.equalToSuperview().offset(-inset)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(inset)
        }
        button.addTarget(self, action: #selector(didSelectTime(_:)), for: .touchUpInside)
    }
    
    @objc private func didSelectTime(_ sender: UIDatePicker) {
        let selectedTime = timePicker.date
        UserDefaultManager.feedingAlert = selectedTime
        requestSendNotification(time: selectedTime)
        print(UserDefaultManager.feedingAlert)
    }
    
    func requestSendNotification(time: Date) {
        // Configure Notification Content
        let content = UNMutableNotificationContent()
        content.title = "밥먹을 시간이 됐어요"
        content.body = "\(UM.userName)님!! 다마고치에게 밥을 주세요!!"
        
        // Set Notification Time
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HHmm"
        
        // 아래 Index 사용 부분은 extension으로 subscript를 구현해야 가능하다.
        let hourString = dateFormatter.string(from: time).substring(toIndex: 2)
        let minuteString = dateFormatter.string(from: time).substring(fromIndex: 2)
        
        guard let hour = Int(hourString), let minute = Int(minuteString) else { return }
        
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Create the request
        let uuidString = "FeedingIdentifier"
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: content,
                                            trigger: trigger)
        
        // Schedule the request with the system.
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

