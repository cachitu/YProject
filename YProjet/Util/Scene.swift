//
//  Scene.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

enum Scene {
    // Welcome
    case welcome(WelcomeViewModel)

    // Create wallet
    case createWallet(CreateWalletViewModel)
    case importWallet(CreateWalletViewModel)
    case watchWallet(CreateWalletViewModel)

    // New wallet
    case collectPhrase(NewWalletViewModel)
    case confirmPhrase(NewWalletViewModel)

    // Settings
    case showSettings(SettingsViewModel)

    // Home
    case home(HomeViewModel)

    // Swap
    case swap(SwapViewModel)

    // Staking
    case staking(StakingViewModel)
    case stakingSummary(StakingViewModel)

    // Gov
    case gov(GovViewModel)
    case govDetails(GovViewModel)
}

extension Scene {
    func viewController() -> UIViewController {
        switch self {
        case let .welcome(viewModel):
            return instantiateViewController(with: WelcomeViewController.self, from: .welcome, bindWith: viewModel)
        case let .createWallet(viewModel):
            return instantiateViewController(with: CreateWalletViewController.self, from: .createWallet, bindWith: viewModel)
        case let .collectPhrase(viewModel):
            return instantiateViewController(with: CollectPhraseViewController.self, from: .createWallet, bindWith: viewModel)
        case let .confirmPhrase(viewModel):
            return instantiateViewController(with: ConfirmPhraseViewController.self, from: .createWallet, bindWith: viewModel)
        case let .importWallet(viewModel):
            return instantiateViewController(with: ImportWalletViewController.self, from: .createWallet, bindWith: viewModel)
        case let .watchWallet(viewModel):
            return instantiateViewController(with: WatchWalletViewController.self, from: .createWallet, bindWith: viewModel)
        case let .showSettings(viewModel):
            return instantiateViewController(with: SettingsViewController.self, from: .settings, bindWith: viewModel)
        case let .home(viewModel):
            return instantiateViewController(with: HomeViewController.self, from: .home, bindWith: viewModel)
        case let .swap(viewModel):
            return instantiateViewController(with: SwapViewController.self, from: .swap, bindWith: viewModel)
        case let .staking(viewModel):
            return instantiateViewController(with: StakingViewController.self, from: .staking, bindWith: viewModel)
        case let .stakingSummary(viewModel):
            return instantiateViewController(with: StakingSummaryViewController.self, from: .staking, bindWith: viewModel)
        case let .gov(viewModel):
            return instantiateViewController(with: GovViewController.self, from: .gov, bindWith: viewModel)
        case let .govDetails(viewModel):
            return instantiateViewController(with: GovDetailsViewController.self, from: .gov, bindWith: viewModel)
        }
    }

    private func instantiateViewController<T: UIViewController & StoryboardIdentifiable & BindableType>(
        with type: T.Type,
        from storyboard: UIStoryboard.Storyboard,
        bindWith viewModel: T.ViewModelType) -> T {
        var viewController: T = UIStoryboard.storyboard(storyboard).instantiateViewController()
        viewController.bind(to: viewModel)
        return viewController
    }

    static func instantiateViewController<T: UIViewController & StoryboardIdentifiable>(
        from storyboard: UIStoryboard.Storyboard) -> T {
        return UIStoryboard.storyboard(storyboard).instantiateViewController()
    }
}

