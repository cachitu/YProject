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

    class var buttonGreen: UIColor {
        return color(with: "ButtonGreen")
    }
}
