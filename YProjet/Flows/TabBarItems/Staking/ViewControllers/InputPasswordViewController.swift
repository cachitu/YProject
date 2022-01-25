//
//  InputPasswordViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 25.01.2022.
//

import UIKit

class InputPasswordViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    var viewModel: StakingViewModel!

    @IBOutlet weak var navigationView: NavigationView!
    @IBOutlet weak var enterPasswordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var faceIdLabel: UILabel!

    @IBAction func faceIDAction(_ sender: UIButton) {

    }

    @IBAction func delegateAction(_ sender: UIButton) {
        // TODO: API request and then
        viewModel.showDelegationSuccess()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.viewDelegate = self
        configureUI()
    }

    private func configureUI() {
        navigationView.title = "Confirm".localized
        navigationView.configure(showBackButton: true, showNotificationButton: true)
        enterPasswordLabel.text = "Enter your password".localized

    }

    func bindViewModel() {}
}

extension InputPasswordViewController: NavigationViewDelegate {
    func backAction() {
        viewModel.pop(animated: true)
    }
}
