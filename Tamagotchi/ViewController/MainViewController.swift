//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet private weak var bubbleImage: UIImageView!
    @IBOutlet private weak var bubbleLabel: UILabel!
    @IBOutlet weak var tamagoImage: UIImageView!
    @IBOutlet private weak var nameBackView: UIView!
    @IBOutlet private weak var nameTitleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet private weak var feedingLabel: UILabel!
    @IBOutlet private weak var feedingTextField: UITextField!
    @IBOutlet private weak var feedingButton: UIButton!
    @IBOutlet private weak var wateringLabel: UILabel!
    @IBOutlet private weak var wateringTextField: UITextField!
    @IBOutlet private weak var wateringButton: UIButton!
    @IBOutlet private var underLineViews: [UIView]!
    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: - ProperTies
    let inspirationMessages = LocalizedString.Inspiration.getMessages()
    let cannotEatMessages = LocalizedString.CannotEatMessage.getMessages()
    let logicManager = LogicManager()
    var tamagotchiInfo: TamagotchiInfo?
    var changedValue: TamagotchiInfo? {
        didSet {
            guard let changedValue else {return}
            UserDefaultManager.pickedTamagotchi = changedValue
            statusLabel.text = String(
                format: Main.status,
                changedValue.level, changedValue.feedingCount, changedValue.wateringCount
            )
            logicManager.levelUp(
                feedingCount: changedValue.feedingCount,
                wateringCount: changedValue.wateringCount,
                type: changedValue.tamagotchiType
            )
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedingTextField.delegate = self
        wateringTextField.delegate = self
        logicManager.delegate = self
        setNavigationColor()
        configUI()
        configBackBarButton(title: "")
        makeBarButtonItem()
        keyboardNotification()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = UM.userName
    }
    
    private func configUI() {
        guard let tamagotchiInfo else {return}
        bubbleLabel.text = inspirationMessages.randomElement()
        bubbleLabel.font = Font.bubbleFont
        tamagoImage.image = Image.getTamagotchiImage(
            type: tamagotchiInfo.tamagotchiType,
            level: tamagotchiInfo.level
        )
        view.backgroundColor = UIColor(cgColor: Color.backgroundColor)
        nameBackView.defaultViewSetting()
        nameTitleLabel.font = Layout.Font.mainNameFont
        nameTitleLabel.textColor = UIColor(cgColor: Layout.Color.fontAndBorderColor)
        underLineViews.forEach {
            $0.backgroundColor = UIColor(cgColor: Color.separatorColor)
        }

        statusLabel.text = String(format: Main.status, tamagotchiInfo.level, tamagotchiInfo.feedingCount, tamagotchiInfo.wateringCount)
        
        configFeedingWatering()
    }
    private func configFeedingWatering() {
        feedingLabel.text = Main.feedingError
        feedingLabel.textColor = .clear
        feedingLabel.font = Font.descriptionFont
        wateringLabel.text = Main.wateringError
        wateringLabel.textColor = .clear
        wateringLabel.font = Font.descriptionFont
        feedingButton.configuration = UIButton.imageButtonConfig(
            title: Main.feeding,
            ofSize: 14,
            weight: .bold,
            systemName: SystemName.leaf_circle
        )
        feedingButton.layoutButton(
            tintColor: UIColor(cgColor: Color.fontAndBorderColor),
            borderColor: Color.fontAndBorderColor,
            borderWidth: Size.backViewBorderWidth,
            cornerRadius: Size.buttonCornerRadius
        )
        wateringButton.configuration = UIButton.imageButtonConfig(
            title: Main.watering,
            ofSize: 14,
            weight: .bold,
            systemName: SystemName.drop_circle
        )
        wateringButton.layoutButton(
            tintColor: UIColor(cgColor: Color.fontAndBorderColor),
            borderColor: Color.fontAndBorderColor,
            borderWidth: Size.backViewBorderWidth,
            cornerRadius: Size.buttonCornerRadius
        )
        
    }
    
    private func makeBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: SystemName.person_circle), style: .plain, target: self, action: #selector(barButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(cgColor: Color.titleColor)
        
    }
    /// 세팅화면으로 넘어가가기
    @objc private func barButtonTapped() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: SettingViewController.identifier) as! SettingViewController
        vc.setTitle(type: .setting)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            guard let num = feedingTextField.text else { return }
            logicManager.feedingLogic(
                numString: num,
                label: feedingLabel,
                textField: feedingTextField,
                bubbleLabel: bubbleLabel,
                tag: sender.tag,
                constraint: LogicManager.feedingConstraint
            )
        } else {
            guard let num = wateringTextField.text else { return }
            logicManager.feedingLogic(
                numString: num,
                label: wateringLabel,
                textField: wateringTextField,
                bubbleLabel: bubbleLabel,
                tag: sender.tag,
                constraint: LogicManager.wateringConstraint
            )
        }
    }
}

extension MainViewController {
    /// 키보드 노티피케이션 등록
    private func keyboardNotification() {
        // 키보드 올라올 때 알림 등록
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        // 키보드 내려갈 때 알림 등록
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    // MARK: - @objc Method
    /// 키보드 올라갈때 호출 메서드
    @objc func keyboardWillShow(_ notification: Notification) {
        var space: Double {
            let diff = view.frame.height - stackView.frame.maxY - 20
            return diff
        }
        guard let keyboardFrame = notification
            .userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        // 신조어 화면 높이 조정 및애니메이션 추가
        UIView.animate(withDuration: notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0.25) {
            self.view.bounds.origin.y = keyboardFrame.height - space
            self.view.layoutIfNeeded()
        }
    }
    
    /// 키보드 내려갈때 호출 메서드
    @objc func keyboardWillHide(_ notification: Notification) {
        // 신조어 화면 높이 조정 및애니메이션 추가
        UIView.animate(withDuration: notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0.25) {
            self.view.bounds.origin.y = 0
            self.view.layoutIfNeeded()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
