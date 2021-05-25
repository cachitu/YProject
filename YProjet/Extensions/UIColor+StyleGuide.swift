//
//  UIColor+StyleGuide.swift
//  YProjet
//
//  Created by cristina.virlan on 15/05/2021.
//

import UIKit

extension UIColor {
    class func color(with assetName: String, default: UIColor = .systemBlue) -> UIColor {
        guard let color = UIColor(named: assetName) else {
            assertionFailure("Missing \(assetName) color from assets!")
            return UIColor.systemBlue
        }
        return color
    }

    class var customGreen: UIColor {
        return color(with: "CustomGreen")
    }

    class var customBlue: UIColor {
        return color(with: "CustomBlue")
    }

    class var customRed: UIColor {
        return color(with: "CustomRed")
    }
}
