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
    private let button: UISwitch = {
       let button = UISwitch()
        button.isOn = (UM.feedingAlert != nil) ? true : false
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
        button.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .touchUpInside)
    }
    
    @objc private func didChangeSwitch(_ sender: UISwitch) {
        let selectedTime = timePicker.date
        if sender.isOn {
            requestSendNotification(time: selectedTime)
            let times = getTime(time: selectedTime)
            showAlert(title: "알람이 설정되었습니다.", message: "매일 \(times.hour)시 \(times.minute)분에 알람이 설정되었습니다.", preferredStyle: .alert, cancelTitle: "확인")
        } else {
            UM.feedingAlert = nil
            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [LT_System.feedingIdentifier])
        }
    }
    
    func requestSendNotification(time: Date) {
        // Configure Notification Content
        let content = UNMutableNotificationContent()
        content.title = "밥먹을 시간이 됐어요"
        content.body = "\(UM.userName ?? LS_Name.userName)님!! 다마고치에게 밥을 주세요!!"
        
        // Set Notification Time
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        
        let times = getTime(time: time)
        dateComponents.hour = times.hour
        dateComponents.minute = times.minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Create the request
        let request = UNNotificationRequest(identifier: LT_System.feedingIdentifier,
                                            content: content,
                                            trigger: trigger)
        
        // Schedule the request with the system.
        UM.feedingAlert = time
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    private func getTime(time: Date) -> (hour: Int, minute: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HHmm"
        
        // 아래 Index 사용 부분은 extension으로 subscript를 구현해야 가능하다.
        let hourString = dateFormatter.string(from: time).substring(toIndex: 2)
        let minuteString = dateFormatter.string(from: time).substring(fromIndex: 2)
        guard let hour = Int(hourString), let minute = Int(minuteString) else { return (0,0) }
        return (hour, minute)
    }
}

