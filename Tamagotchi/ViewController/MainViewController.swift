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
    
    // MARK: - Properties
    private let inspirationMessages = LS_Inspiration.getMessages()
    private let cannotEatMessages = LS_CannotEatMessage.getMessages()
    private let logicManager = LogicManager()
    var tamagotchiInfo: TamagotchiInfo?
    var changedValue: TamagotchiInfo? {
        didSet {
            guard let changedValue else {return}
            UserDefaultManager.pickedTamagotchi = changedValue
            statusLabel.text = String(
                format: LT_Main.status,
                changedValue.level, changedValue.feedingCount, changedValue.wateringCount
            )
            logicManager.levelUp(
                feedingCount: changedValue.feedingCount,
                wateringCount: changedValue.wateringCount,
                type: changedValue.tamagotchiType
            )
        }
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationColor()
        registerDelegates()
        configBackBarButton(title: "")
        configUpperView()
        configFeedingWateringView()
        makeRightBarButtonItem()
        keyboardNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = UM.userName + LT_Title.userTamagotchi
    }
    
    // MARK: - Methods

    /// 델리게이트 등록
    private func registerDelegates() {
        feedingTextField.delegate = self
        wateringTextField.delegate = self
        logicManager.delegate = self
    }
    
    // MARK: - Action Methods

    /// 세팅화면으로 넘어가가기
    @objc private func barButtonTapped() {
        HapticsManager.shared.vibrateForSelection()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: SettingViewController.identifier) as! SettingViewController
        vc.setTitle(type: .setting)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func ButtonTapped(_ sender: UIButton) {
        HapticsManager.shared.vibrateForSelection()
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

// MARK: - ConfigurationUI Methods

extension MainViewController {
    
    /// 상단 부분 구성
    private func configUpperView() {
        guard let tamagotchiInfo else {return}
        bubbleLabel.text = inspirationMessages.randomElement()
        bubbleLabel.font = LT_Font.bubbleFont
        bubbleLabel.textColor = LT_Color.titleColor
        tamagoImage.image = LT_Image.getTamagotchiImage(
            type: tamagotchiInfo.tamagotchiType,
            level: tamagotchiInfo.level
        )
        view.backgroundColor = LT_Color.backgroundColor
        nameBackView.defaultViewSetting()
        nameTitleLabel.text = tamagotchiInfo.name
        nameTitleLabel.font = Layout.Font.mainNameFont
        nameTitleLabel.textColor = LT_Color.fontAndBorderColor
        underLineViews.forEach {
            $0.backgroundColor = LT_Color.separatorColor
        }
        statusLabel.text = String(
            format: LT_Main.status,
            tamagotchiInfo.level,
            tamagotchiInfo.feedingCount,
            tamagotchiInfo.wateringCount
        )
        statusLabel.textColor = .gray
        
    }
    /// 밥주기 부분 구성
    private func configFeedingWateringView() {
        feedingTextField.textColor = LT_Color.fontAndBorderColor
        feedingTextField.keyboardType = .numberPad
        wateringTextField.textColor = LT_Color.fontAndBorderColor
        wateringTextField.keyboardType = .numberPad
        feedingLabel.text = LT_Main.feedingError
        feedingLabel.textColor = .clear
        feedingLabel.font = LT_Font.errorLabelFont
        wateringLabel.text = LT_Main.wateringError
        wateringLabel.textColor = .clear
        wateringLabel.font = LT_Font.errorLabelFont
        feedingButton.configuration = UIButton.imageButtonConfig(
            title: LT_Main.feeding,
            ofSize: 14,
            weight: .bold,
            systemName: SystemName.leaf_circle
        )
        feedingButton.layoutButton(
            tintColor: LT_Color.fontAndBorderColor ?? UIColor.label,
            borderColor: LT_Color.fontAndBorderColor?.cgColor ?? UIColor.label.cgColor,
            borderWidth: LT_Size.backViewBorderWidth,
            cornerRadius: LT_Size.buttonCornerRadius
        )
        wateringButton.configuration = UIButton.imageButtonConfig(
            title: LT_Main.watering,
            ofSize: 14,
            weight: .bold,
            systemName: SystemName.drop_circle
        )
        wateringButton.layoutButton(
            tintColor: LT_Color.fontAndBorderColor ?? UIColor.label,
            borderColor: LT_Color.fontAndBorderColor?.cgColor ?? UIColor.label.cgColor,
            borderWidth: LT_Size.backViewBorderWidth,
            cornerRadius: LT_Size.buttonCornerRadius
        )
    }
    
    /// 우측 바 버튼 만들기
    private func makeRightBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: SystemName.person_circle),
            style: .plain,
            target: self,
            action: #selector(barButtonTapped)
        )
        navigationItem.rightBarButtonItem?.tintColor = LT_Color.titleColor
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
    @objc private func keyboardWillShow(_ notification: Notification) {
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
    @objc private func keyboardWillHide(_ notification: Notification) {
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

// MARK: - TextField Delegate

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
