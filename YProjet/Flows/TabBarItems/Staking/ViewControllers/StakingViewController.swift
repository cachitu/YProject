//
//  StakingViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import UIKit

class StakingViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    var viewModel: StakingViewModel!
    @IBOutlet weak var navigationView: NavigationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.viewDelegate = self
        configureUI()
    }

    func configureUI() {
        navigationView.title = "Staking".localized
        navigationView.configure(showNotificationButton: true, showSettingsButton: true)
    }

    func bindViewModel() {}
}

extension StakingViewController: NavigationViewDelegate {

}

