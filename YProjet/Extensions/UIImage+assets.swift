//
//  UIImage+assets.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

enum Images {
    enum TabBarIcons: String, ImageAsset {
        case home = "wallet"
        case swap = "003-refresh"
        case staking = "001-stacked-files"
        case gov = "004-check"
    }

    enum NavigationBarIcons: String, ImageAsset {
        case notification = "bell-ring"
        case settings = "settings"
    }

    enum Wallet: String, ImageAsset {
        case copy = "copy"
        case qrCode = "qr-icon"
    }
}

protocol ImageAsset {
    var image: UIImage? { get }
}

extension ImageAsset where Self: RawRepresentable {
    var image: UIImage? {
        return (rawValue as? String).flatMap { UIImage(named: $0) }
    }
}

