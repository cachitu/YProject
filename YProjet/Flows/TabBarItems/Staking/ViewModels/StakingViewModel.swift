//
//  StakingViewModel.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import Foundation

protocol StakingCoordinatorProtocol: Coordinator {
    func claimRewards()
    func showSummary()
    func showValidatorDetails()
    func startDelegateFlow()
    func confirmDelegation()
    func delegate()
}

class StakingViewModel: BaseViewModel, CoordinableViewModel  {
    weak var coordinator: StakingCoordinatorProtocol?

    required init(coordinator: StakingCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init()

    }

    func pop(animated: Bool) {
        coordinator?.pop(animated: animated, completion: nil)
    }

    func popToRoot(animated: Bool) {
        coordinator?.popToRoot(animated: animated, completion: nil)
    }
}

// Navigation
extension StakingViewModel {
    func claimRewards() {
        coordinator?.claimRewards()
    }

    func showSummary() {
        coordinator?.showSummary()
    }

    func showValidatorDetails() {
        coordinator?.showValidatorDetails()
    }

    func startDelegateFlow() {
        coordinator?.startDelegateFlow()
    }

    func confirmDelegation() {
        coordinator?.confirmDelegation()
    }

    func delegate() {
        coordinator?.delegate()
    }
}
