//
//  UIViewContreoller+Extension.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import UIKit

extension UIViewController {
    static var indentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    static var indentifier: String {
        return String(describing: self)
    }
}
