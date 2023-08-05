//
//  UIViewContreoller+Extension.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import UIKit.UIViewController

extension UIViewController {
    typealias Color = Layout.Color
    typealias Font = Layout.Font
    typealias Size = Layout.Size
    typealias Image = Layout.Image
    
    static var identifier: String {
        return String(describing: self)
    }
    

}


