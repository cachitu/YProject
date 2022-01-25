//
//  GovCoordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import UIKit

class GovCoordinator: Coordinator {

    override func start() {
        showGov(type: .navigationRoot)
    }

    func showGov(type: SceneTransitionType) {
        transition(to: .gov(GovViewModel(coordinator: self)), type: type, animated: true, completion: nil)
    }

    override func flowFinished() {
        pop(animated: true, completion: nil)
    }
}

extension GovCoordinator: GovCoordinatorProtocol {
    func showDetails() {
        transition(to: .govDetails(GovViewModel(coordinator: self)), type: .push, animated: true, completion: nil)
    }
}
