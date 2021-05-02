//
//  TransitionType.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

enum SceneTransitionType {
    case navigationRoot
    case push
    case modal(UIModalPresentationStyle)
    case presentCoordinator
    case presentCoordinatorOverCurrentContext
    @available(*, deprecated)
    case alert
}
