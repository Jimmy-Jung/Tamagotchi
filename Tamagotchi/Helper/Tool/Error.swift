//
//  Error.swift
//  Tamagotchi
//
//  Created by 정준영 on 2023/08/16.
//

import Foundation


enum FeedingError: Error {
    case isNotNumber
    case tooMuch
    case minusNumber
}
