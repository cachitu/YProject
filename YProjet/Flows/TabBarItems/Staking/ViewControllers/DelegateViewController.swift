//
//  DelegateViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 25.01.2022.
//

import UIKit

class DelegateViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    var viewModel: StakingViewModel!

    @IBOutlet weak var navigationView: NavigationView!

    // Delegation View Outlets
    @IBOutlet weak var validatorImageView: UIImageView!
    @IBOutlet weak var validatorNameLabel: UILabel!
    @IBOutlet weak var validatorStatusLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressValueLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var detailsValueLabel: UILabel!

    @IBAction func nextAction(_ sender: UIButton) {
        viewModel.confirmDelegation()
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
        navigationView.title = "Delegate".localized
        navigationView.configure(showBackButton: true, showNotificationButton: true)
        configureDelegationView()
    }

    // TODO: send Validator object here
    private func configureDelegationView() {
        validatorImageView.image = UIImage(named: "validator-icon")
        validatorNameLabel.text = "0base.vc"
        validatorStatusLabel.text = "Active" // TBD: values and color customization
        addressLabel.text = "Operator address".localized
        addressValueLabel.text = "terra1hfu02n2t4mre9w6qdrs7k8u7jpsgpt5ldj283t"
        detailsLabel.text = "Details".localized
        detailsValueLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing"
    }

    func bindViewModel() {}
}

extension DelegateViewController: NavigationViewDelegate {
    func backAction() {
        viewModel.pop(animated: true)
    }
}
