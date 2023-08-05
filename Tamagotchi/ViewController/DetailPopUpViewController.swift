//
//  DetailPopUpViewController.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit

final class DetailPopUpViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }

    private func configUI() {
        guard let tamago = tamagotchiInfo else {return}
        tamagoImage.image = Layout.getTamagochiImage(
            type: tamago.tamagotchiType,
            level: tamago.level
        )
        backgroundView.backgroundColor = Layout.backgroundColor
        backgroundView.layer.cornerRadius = 10
        backgroundView.clipsToBounds = true
        view.backgroundColor = UIColor(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0.5))
        nameBackView.defaultViewSetting()
        nameTitleLabel.defaultLabelSetting()
        separatorLineView.backgroundColor = UIColor(cgColor: Layout.fontAndBorderColor)
        descriptionLabel.text = Layout.getDescription(type: tamago.tamagotchiType)
        descriptionLabel.textColor = UIColor(cgColor: Layout.fontAndBorderColor)
        descriptionLabel.font = Layout.descriptionFont
        buttonSeparatorLineView.backgroundColor = UIColor(cgColor: Layout.fontAndBorderColor)
        cancelButton.backgroundColor = UIColor(cgColor: Layout.cancelBackgroundColor)
        startButton.backgroundColor = Layout.backgroundColor
        
        cancelButton.configuration = UIButton.plainButtonConfig(
            title: LocalizedString.System.cancel,
            titleColor: UIColor(cgColor: Layout.fontAndBorderColor),
            ofSize: 14,
            weight: .bold
        )
        startButton.configuration = UIButton.plainButtonConfig(
            title: LocalizedString.System.start,
            titleColor: UIColor(cgColor: Layout.fontAndBorderColor),
            ofSize: 14,
            weight: .medium
        )
        
    }
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
    }
    
}
