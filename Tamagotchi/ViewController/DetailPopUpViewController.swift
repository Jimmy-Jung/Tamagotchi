//
//  DetailPopUpViewController.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit

final class DetailPopUpViewController: UIViewController {
    typealias Color = Layout.Color
    typealias Font = Layout.Font
    typealias Size = Layout.Size
    typealias Image = Layout.Image

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var tamagoImage: UIImageView!
    @IBOutlet weak var nameBackView: UIView!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var separatorLineView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var buttonSeparatorLineView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var tamagotchiInfo: TamagotchiInfo?
    var segueType: SegueType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    private func configUI() {
        guard let tamago = tamagotchiInfo else {return}
        tamagoImage.image = Image.getTamagochiImage(
            type: tamago.tamagotchiType,
            level: tamago.level
        )
        backgroundView.backgroundColor = UIColor(cgColor: Color.backgroundColor)
        backgroundView.layer.cornerRadius = 10
        backgroundView.clipsToBounds = true
        view.backgroundColor = UIColor(cgColor: Color.seeThroughBackgroundColor)
        nameBackView.defaultViewSetting()
        nameTitleLabel.defaultLabelSetting()
        separatorLineView.backgroundColor = UIColor(cgColor: Color.separatorColor)
        descriptionLabel.text = LocalizedString.Description.getDescription(type: tamago.tamagotchiType)
        descriptionLabel.textColor = UIColor(cgColor: Color.fontAndBorderColor)
        descriptionLabel.font = Font.descriptionFont
        buttonSeparatorLineView.backgroundColor = UIColor(cgColor: Color.separatorColor)
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
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
        // 색 변화 트랜지션 효과 적용
        UIButton.buttonTapEffect(button: sender, type: .cancel)
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
        UIButton.buttonTapEffect(button: sender, type: .defaults)
    }
    
}
