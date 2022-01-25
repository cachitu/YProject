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

    func claimRewards() {
        //        transition(to: .watchWallet(CreateWalletViewModel(coordinator: self)), type: .push, animated: true, completion: nil)
    }

    func showSummary() {
        transition(to: .stakingSummary(StakingViewModel(coordinator: self)), type: .push, animated: true, completion: nil)
    }

    func showValidatorDetails() {
        transition(to: .showValidatorDetails(StakingViewModel(coordinator: self)), type: .push, animated: true, completion: nil)
    }
}
