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
        setTitleColor()
        configUI()
    }
    
    // MARK: - Methods

    private func configUI() {
        guard let tamagotchiInfo else {return}
        // 다마고치 이미지 설정
        tamagoImage.image = Image.getTamagotchiImage(
            type: tamagotchiInfo.tamagotchiType,
            level: 6
        )
        // 배경색상 및 코너
        backgroundView.backgroundColor = UIColor(cgColor: Color.backgroundColor)
        backgroundView.layer.cornerRadius = 10
        backgroundView.clipsToBounds = true
        // 뷰컨트롤러 배경색상 반투명색
        view.backgroundColor = UIColor(cgColor: Color.seeThroughBackgroundColor)
        // 이름 배경 레이아웃 설정
        nameBackView.defaultViewSetting()
        // 이름 레이블 레이아웃 설정
        nameTitleLabel.defaultLabelSetting()
        // 구분 선 색상 설정
        separatorLineView.backgroundColor = UIColor(cgColor: Color.separatorColor)
        // 설명 텍스트 및 레이아웃 설정
        descriptionLabel.text = LocalizedString.Description.getDescription(type: tamagotchiInfo.tamagotchiType)
        descriptionLabel.textColor = UIColor(cgColor: Color.fontAndBorderColor)
        descriptionLabel.font = Font.descriptionFont
        // 버튼 위 구분 선 색상 설정
        buttonSeparatorLineView.backgroundColor = UIColor(cgColor: Color.separatorColor)
        // 버튼 색상 설정 및 레이아웃 설정
        cancelButton.backgroundColor = UIColor(cgColor: Color.cancelBackgroundColor)
        startButton.backgroundColor = UIColor(cgColor: Color.backgroundColor)
        cancelButton.configuration = UIButton.plainButtonConfig(
            title: LocalizedString.System.cancel,
            titleColor: UIColor(cgColor: Color.fontAndBorderColor),
            ofSize: 14,
            weight: .bold
        )
        startButton.configuration = UIButton.plainButtonConfig(
            title: LocalizedString.System.start,
            titleColor: UIColor(cgColor: Color.fontAndBorderColor),
            ofSize: 14,
            weight: .medium
        )
    }
    
    private func changeRootViewController() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: MainViewController.identifier) as! MainViewController
        vc.setTitle(type: .userTamagotchi)
        vc.tamagotchiInfo = UserDefaultManager.pickedTamagotchi
        let nav = UINavigationController(rootViewController: vc)
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    
    // MARK: - IBAction

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        // 색 변화 트랜지션 효과 적용
        UIButton.buttonTapEffect(button: sender, type: .cancel)
        dismiss(animated: true)
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
        UIButton.buttonTapEffect(button: sender, type: .defaults)
        // 유저디폴드에 다마고치 넣어주기
        // 다음 실행부터 Main화면에서 시작
        UserDefaultManager.pickedTamagotchi = tamagotchiInfo
        changeRootViewController()
    }
    
    
    
}
