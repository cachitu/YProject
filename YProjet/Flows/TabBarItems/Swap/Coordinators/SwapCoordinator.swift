//
//  SwapCoordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import UIKit

class SwapCoordinator: Coordinator {

    //private var settingsCoordinator: SettingsCoordinator?

    override func start() {
        showSwap(type: .navigationRoot)
    }

    func showSwap(type: SceneTransitionType) {
        transition(to: .swap(SwapViewModel(coordinator: self)), type: type, animated: true, completion: nil)
    }

    override func childCoordinatorDidFinish(coordinator: Coordinator) {
//        switch coordinator {
//        case is SettingsCoordinator:
//            settingsCoordinator = nil
//        default:
//            break
//        }
    }

    override func flowFinished() {
        pop(animated: true, completion: nil)
        parentCoordinator?.childCoordinatorDidFinish(coordinator: self)
    }
}

extension SwapCoordinator: SwapCoordinatorProtocol {
    func performNextAction() {

    }
}

