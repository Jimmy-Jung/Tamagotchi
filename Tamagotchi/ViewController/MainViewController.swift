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
    @IBOutlet private weak var tamagoImage: UIImageView!
    @IBOutlet private weak var nameBackView: UIView!
    @IBOutlet private weak var nameTitleLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var feedingLabel: UILabel!
    @IBOutlet private weak var feedingTextField: UITextField!
    @IBOutlet private weak var feedingButton: UIButton!
    @IBOutlet private weak var wateringLabel: UILabel!
    @IBOutlet private weak var wateringTextField: UITextField!
    @IBOutlet private weak var wateringButton: UIButton!
    @IBOutlet private var underLineViews: [UIView]!
    
    // MARK: - ProperTies
    let inspirationMessages = LocalizedString.Inspiration.getMessages()
    let cannotEatMessages = LocalizedString.CannotEatMessage.getMessages()
    let logicManager = LogicManager()
    var tamagotchiInfo: TamagotchiInfo?
    var changedValue: TamagotchiInfo? {
        didSet {
            guard let changedValue else {return}
            UserDefaultManager.pickedTamagotchi = changedValue
            statusLabel.text = String(format: Main.status, changedValue.level, changedValue.feedingCount, changedValue.wateringCount)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logicManager.delegate = self
        setTitleColor()
        configUI()
        makeBarButtonItem()
    }
    
    private func configUI() {
        guard let tamagotchiInfo else {return}
        bubbleLabel.text = inspirationMessages.randomElement()
        bubbleLabel.font = Font.bubbleFont
        tamagoImage.image = Image.getTamagochiImage(
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
        feedingTextField.delegate = self
        wateringTextField.delegate = self
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
            title: Main.feeding,
            ofSize: 14,
            weight: .bold,
            systemName: SystemName.leaf_circle
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
    
    @objc private func barButtonTapped() {
        //세팅화면으로 넘어가가기
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension MainViewController: UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        feedingLabel.text = ""
//        feedingLabel.textColor = .clear
//        wateringLabel.text = ""
//        wateringLabel.textColor = .clear
//    }
}
