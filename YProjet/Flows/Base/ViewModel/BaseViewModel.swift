//
//  BaseViewModel.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import RxSwift

class BaseViewModel {
    private(set) var disposeBag = DisposeBag()

    func reset() {
        disposeBag = DisposeBag()
    }
}
