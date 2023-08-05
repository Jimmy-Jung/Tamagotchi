//
//  TamagochiCollectionViewCell.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import UIKit

final class TamagotchiCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var tamagotchiImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var titleBackView: UIView!
    
    var tamagotchiInfo: TamagotchiInfo? {
        didSet {
            guard let tamagotchiInfo else { return }
            tamagotchiImage.image = Layout.Image.getTamagochiImage(
                type: tamagotchiInfo.tamagotchiType,
                level: tamagotchiInfo.level
            )
            titleLabel.text = tamagotchiInfo.name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        titleBackView.defaultViewSetting()
        titleLabel.defaultLabelSetting()
    }

}