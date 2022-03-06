//
//  UIStoryboard+extension.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

extension UIStoryboard {
    /// The uniform place where we state all the storyboard we have in our application
    enum Storyboard: String {
        case mainTabBar
        case welcome
        case createWallet
        case settings
        case home
        case staking
        case gov

        var filename: String {
            return rawValue.capitalizingFirstLetter()
        }
    }

    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }

    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }

    func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        return viewController
    }
}

