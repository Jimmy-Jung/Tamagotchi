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
    @IBOutlet private weak var feedingButton: UIButton!
    @IBOutlet private weak var wateringLabel: UILabel!
    @IBOutlet private weak var wateringButton: UIButton!
    @IBOutlet private var underLineViews: [UIView]!
    
    // MARK: - ProperTies

    var tamagotchiInfo: TamagotchiInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleColor()
        configUI()
        makeBarButtonItem()
    }
    
    private func configUI() {
        guard let tamago = tamagotchiInfo else {return}
        tamagoImage.image = Image.getTamagochiImage(
            type: tamago.tamagotchiType,
            level: tamago.level
        )
        view.backgroundColor = UIColor(cgColor: Color.backgroundColor)
        nameBackView.defaultViewSetting()
        nameTitleLabel.defaultLabelSetting()
        underLineViews.forEach {
            $0.backgroundColor = UIColor(cgColor: Color.separatorColor)
        }

        statusLabel.text = String(format: Main.status, tamago.level, tamago.feedingCount, tamago.wateringCount)
    }
    
    private func makeBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(barButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(cgColor: Color.titleColor)
        
    }
    
    @objc private func barButtonTapped() {
        //세팅화면으로 넘어가가기
    }
}
