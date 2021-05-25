//
//  SwapViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import UIKit

class SwapViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    var viewModel: SwapViewModel!
    @IBOutlet weak var navigationView: NavigationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.viewDelegate = self
        configureUI()
    }

    func configureUI() {
        navigationView.title = "Swap".localized
        navigationView.configure(showNotificationButton: true, showSettingsButton: true)
    }

    func bindViewModel() {}
}

extension SwapViewController: NavigationViewDelegate {
    func notificationAction() {

    }

    func settingsAction() {

    }
}


