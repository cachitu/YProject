//
//  StakingViewModel.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import Foundation

protocol StakingCoordinatorProtocol: Coordinator {

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
}

// Navigation
extension StakingViewModel {

}
