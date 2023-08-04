//
//  TamagochiCollectionViewCell.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import UIKit

final class TamagochiCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tamagochiImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleBackView: UIView!
    var tamagochiInfo: TamagochiInfo {
        didSet {
            switch tamagochiInfo.tamagochiType {
            case .sting:
                tamagochiImage.image = UI
            case .smiling:
            case .shinning:
            }
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
