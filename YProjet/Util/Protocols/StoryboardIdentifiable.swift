//
//  StoryboardIdentifiable.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
