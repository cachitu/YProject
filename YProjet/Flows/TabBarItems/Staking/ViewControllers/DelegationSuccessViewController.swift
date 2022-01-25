//
//  DelegationSuccessViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 25.01.2022.
//

import UIKit

class DelegationSuccessViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    var viewModel: StakingViewModel!

    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet weak var delegateLabel: UILabel!
    @IBOutlet weak var delegationAmountLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var validatorNameLabel: UILabel!
    @IBOutlet weak var backToStakingButton: UIButton!

    @IBAction func backToStakingAction(_ sender: UIButton) {
        viewModel.popToRoot(animated: true)
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
        configureUI()
    }

    private func configureUI() {
        successLabel.text = "Success".localized
        delegateLabel.text = "You Delegated".localized
        delegationAmountLabel.text = "0.50000 LUNA" // TO DO: actual value here
        validatorNameLabel.text = "Obase.vc" // TO DO: actual value here
    }

    func bindViewModel() {}
}
