//
//  TamagochiCollectionViewCell.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import UIKit

final class TamagochiCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var tamagochiImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var titleBackView: UIView!
    
    var tamagochiInfo: TamagochiInfo? {
        didSet {
            guard let tamagochiInfo else { return }
            tamagochiImage.image = Layout.getTamagochiImage(
                type: tamagochiInfo.tamagochiType,
                level: tamagochiInfo.level
            )
            titleLabel.text = tamagochiInfo.name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        titleBackView.defaultViewSetting()
        titleLabel.defaultLabelSetting()
    }

}
