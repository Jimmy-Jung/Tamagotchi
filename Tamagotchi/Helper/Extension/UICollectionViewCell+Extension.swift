//
//  UICollectionViewCell+Extension.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/05.
//

import UIKit.UICollectionViewCell

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
