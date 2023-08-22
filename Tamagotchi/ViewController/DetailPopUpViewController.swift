//
//  DetailPopUpViewController.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit

final class DetailPopupViewController: UIViewController {
    // MARK: - IBOutlet

    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var tamagoImage: UIImageView!
    @IBOutlet private weak var nameBackView: UIView!
    @IBOutlet private weak var nameTitleLabel: UILabel!
    @IBOutlet private weak var separatorLineView: UIView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var buttonSeparatorLineView: UIView!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var startButton: UIButton!
    
    // MARK: - ProperTies

    var tamagotchiInfo: TamagotchiInfo?
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        configBackground()
        configLabels()
        configButton()
    }
    
    // MARK: - Methods
    
    /// 루트 뷰컨트롤러 교체 메서드
    private func changeRootViewController() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: TamagotchiManagementViewController.identifier) as! TamagotchiManagementViewController
        vc.setTitle(type: .userTamagotchi)
        vc.tamagotchiInfo = UserDefaultManager.pickedTamagotchi
        let nav = UINavigationController(rootViewController: vc)
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    
    // MARK: - IBAction

    @IBAction private func cancelButtonTapped(_ sender: UIButton) {
        // 색 변화 트랜지션 효과 적용
        UIButton.buttonTapEffect(button: sender, type: .cancel)
        dismiss(animated: true)
    }
    @IBAction private func startButtonTapped(_ sender: UIButton) {
        UIButton.buttonTapEffect(button: sender, type: .defaults)
        // 유저디폴드에 다마고치 넣어주기
        // 다음 실행부터 Main화면에서 시작
        if var pickedTamago = UserDefaultManager.pickedTamagotchi, let tamagotchiInfo {
            pickedTamago.changeType(to: tamagotchiInfo.tamagotchiType)
            UserDefaultManager.pickedTamagotchi = pickedTamago
            changeRootViewController()
        } else {
            UserDefaultManager.pickedTamagotchi = tamagotchiInfo
            changeRootViewController()
        }
    }
}

// MARK: - ConfigurationUI Methods

extension DetailPopupViewController {
    /// 버튼 색상 설정 및 레이아웃 설정
    private func configButton() {
        guard let tamagotchiInfo else {return}
        cancelButton.backgroundColor = LT_Color.cancelBackgroundColor
        startButton.backgroundColor = LT_Color.backgroundColor
        cancelButton.configuration = UIButton.plainButtonConfig(
            title: LS_System.cancel,
            titleColor: LT_Color.fontAndBorderColor ?? UIColor.label,
            ofSize: 14,
            weight: .bold
        )
        if tamagotchiInfo.tamagotchiType == .none {
            startButton.isHidden = true
        } else {
            startButton.configuration = UIButton.plainButtonConfig(
                title: LS_System.start,
                titleColor: LT_Color.fontAndBorderColor ?? UIColor.label,
                ofSize: 14,
                weight: .medium
            )
        }
    }
    
    /// 다마고치 이미지 설정
    private func fetchImage() {
        guard let tamagotchiInfo else {return}
        tamagoImage.image = LT_Image.getTamagotchiImage(
            type: tamagotchiInfo.tamagotchiType,
            level: 6
        )
    }
    
    /// 배경 관련 뷰 구성
    private func configBackground() {
        // 배경색상 및 코너 구성
        backgroundView.backgroundColor = LT_Color.backgroundColor
        backgroundView.layer.cornerRadius = 10
        backgroundView.clipsToBounds = true
        // 뷰컨트롤러 배경색상 반투명색
        view.backgroundColor = LT_Color.seeThroughBackgroundColor
        // 이름 배경 레이아웃 설정
        nameBackView.defaultViewSetting()
        // 구분 선 색상 설정
        separatorLineView.backgroundColor = LT_Color.separatorColor
        // 버튼 위 구분 선 색상 설정
        buttonSeparatorLineView.backgroundColor = LT_Color.separatorColor
    }
    
    /// 레이블 구성
    private func configLabels() {
        guard let tamagotchiInfo else {return}
        // 이름 레이블 레이아웃 설정
        nameTitleLabel.defaultLabelSetting()
        nameTitleLabel.text = tamagotchiInfo.name
        // 설명 텍스트 및 레이아웃 설정
        descriptionLabel.text = LS_Description.getDescription(type: tamagotchiInfo.tamagotchiType)
        descriptionLabel.textColor = LT_Color.fontAndBorderColor
        descriptionLabel.font = LT_Font.descriptionFont
    }
}
