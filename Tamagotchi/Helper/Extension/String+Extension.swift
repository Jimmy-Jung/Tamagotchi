//
//  String+Extension.swift
//  Tamagochi
//
//  Created by 정준영 on 2023/08/04.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
