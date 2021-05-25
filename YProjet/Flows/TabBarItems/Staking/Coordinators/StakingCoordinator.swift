//
//  StakingCoordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import UIKit

class StakingCoordinator: Coordinator {

    override func start() {
        showStaking(type: .navigationRoot)
    }

    func showStaking(type: SceneTransitionType) {
        transition(to: .staking(StakingViewModel(coordinator: self)), type: type, animated: true, completion: nil)
    }

    override func flowFinished() {
        pop(animated: true, completion: nil)
    }
}

extension StakingCoordinator: StakingCoordinatorProtocol {

}
