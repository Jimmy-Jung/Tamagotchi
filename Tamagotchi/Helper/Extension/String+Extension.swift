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
    
    func substring(fromIndex: Int) -> String {
        return String(self[index(startIndex, offsetBy: fromIndex)...])
    }

    func substring(toIndex: Int) -> String {
        return String(self[..<index(startIndex, offsetBy: toIndex)])
    }
}
