//
//  HomeCoordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

class HomeCoordinator: Coordinator {

    override func start() {
        showHome(type: .navigationRoot)
    }

    func showHome(type: SceneTransitionType) {
        transition(to: .home(HomeViewModel(coordinator: self)), type: type, animated: true, completion: nil)
    }

    override func flowFinished() {
        pop(animated: true, completion: nil)
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {

}

