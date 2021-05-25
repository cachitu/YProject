//
//  GovViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import UIKit

class GovViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    var viewModel: GovViewModel!
    @IBOutlet weak var navigationView: NavigationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.viewDelegate = self
        configureUI()
    }

    func configureUI() {
        navigationView.title = "Governance".localized
        navigationView.configure(showNotificationButton: true, showSettingsButton: true)
    }

    func bindViewModel() {}
}

extension GovViewController: NavigationViewDelegate {

}
