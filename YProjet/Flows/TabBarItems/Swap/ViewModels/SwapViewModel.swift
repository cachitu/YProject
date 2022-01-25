//
//  SwapViewModel.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import Foundation

protocol SwapCoordinatorProtocol: Coordinator {
    func performNextAction()
    //func showSettings()
}

class SwapViewModel: BaseViewModel, CoordinableViewModel  {
    weak var coordinator: SwapCoordinatorProtocol?

    required init(coordinator: SwapCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init()

    }

    func pop(animated: Bool) {
        coordinator?.pop(animated: animated, completion: nil)
    }
}

// Navigation
extension SwapViewModel {
    func performNextAction() {
        coordinator?.performNextAction()
    }

//    func showSettings() {
//        coordinator?.showSettings()
//    }
}
