//
//  DataSourceState.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import Foundation
import RxRelay
import RxSwift

enum DataSourceState<T> {
    case initial
    case error(error: Error)
    case dataChanged(T)
    case loading

    var isLoading: Bool {
        switch self {
        case .loading:
            return true
        default:
            return false
        }
    }

    var isError: Bool {
        switch self {
        case .error:
            return true
        default:
            return false
        }
    }

    var hasData: Bool {
        switch self {
        case .dataChanged:
            return true
        default:
            return false
        }
    }

    var isInitial: Bool {
        switch self {
        case .initial:
            return true
        default:
            return false
        }
    }
}

protocol StateObject {
    associatedtype Object
    var state: BehaviorRelay<DataSourceState<Object>> { get }
    var object: Object { get }
    var isLoading: Bool { get }
    var isError: Bool { get }
    var hasData: Bool { get }
    var isInitial: Bool { get }
}

class DataSourceStateObject<T>: StateObject {
    let state: BehaviorRelay<DataSourceState<T>>
    private var data: BehaviorRelay<T>

    var object: T {
        return data.value
    }
    var isLoading: Bool {
        return state.value.isLoading
    }

    var isError: Bool {
        return state.value.isError
    }

    var hasData: Bool {
        return state.value.hasData
    }

    var isInitial: Bool {
        return state.value.isInitial
    }

    private let disposeBag = DisposeBag()

    init(with object: T) {
        self.data = BehaviorRelay<T>(value: object)
        state = .init(value: .initial)
        state.subscribe(onNext: { [weak self] dataSourceState in
            switch dataSourceState {
            case .dataChanged(let object):
                self?.data.accept(object)
            default:
                break
            }
        }).disposed(by: disposeBag)
    }
}

extension DataSourceStateObject where Object: Collection {
    var isEmpty: Bool {
        return self.object.isEmpty
    }

    var shouldShowError: Bool {
        return self.isEmpty && self.isError
    }
}

