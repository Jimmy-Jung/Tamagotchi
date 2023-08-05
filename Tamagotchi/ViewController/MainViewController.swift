//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet weak var bubbleImage: UIImageView!
    @IBOutlet weak var bubbleLabel: UILabel!
    @IBOutlet weak var tamagoImage: UIImageView!
    @IBOutlet weak var nameBackView: UIView!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var feedingLabel: UILabel!
    @IBOutlet weak var feedingButton: UIButton!
    @IBOutlet weak var wateringLabel: UILabel!
    @IBOutlet weak var wateringButton: UIButton!
    @IBOutlet var underLineViews: [UIView]!
    
    // MARK: - ProperTies

    var tamagotchiInfo: TamagotchiInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = UserDefaultManager.userName + LocalizedString.Title.mainVC
        configUI()
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
        statusLabel.text = {
            let level = String(tamago.level)
            let feedingCount = String(tamago.feedingCount)
            let wateringCount = String(tamago.wateringCount)
            return "LV\(level) • 밥알 \(feedingCount)개 • 물방울 \(wateringCount)개"
        }()
        
    }

}
