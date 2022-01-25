//
//  ConfirmDelegationViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 25.01.2022.
//

import UIKit

class ConfirmDelegationViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    var viewModel: StakingViewModel!

    @IBOutlet weak var navigationView: NavigationView!

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountValueLabel: UILabel!
    @IBOutlet weak var transactionFeeLabel: UILabel!
    @IBOutlet weak var tokenLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var feeSelectionButton: UIButton! // TODO: highlighted style
    
    @IBAction func nextAction(_ sender: UIButton) {
        viewModel.delegate()
    }

    @IBAction func selectAction(_ sender: UIButton) {
        presentOptions()
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
        amountLabel.text = "Amount".localized
        amountValueLabel.text = "0.5000000 LUNA"
        transactionFeeLabel.text = "Transaction fee".localized
        tokenLabel.text = "LUNA" // TODO: use a default value from the real data
        valueLabel.text = "0.001071"
    }

    // TODO: display real options here
    private func presentOptions() {

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "LUNA", style: .default , handler: { [weak self] (UIAlertAction) in
            self?.tokenLabel.text = "LUNA"
        }))

        alert.addAction(UIAlertAction(title: "KRT", style: .default , handler: { [weak self] (UIAlertAction) in
            self?.tokenLabel.text = "KRT"
        }))

        alert.addAction(UIAlertAction(title: "MINT", style: .default, handler: { [weak self] (UIAlertAction) in
            self?.tokenLabel.text = "MINT"
        }))

        self.present(alert, animated: true, completion: nil)
    }

    func bindViewModel() {}
}

extension ConfirmDelegationViewController: NavigationViewDelegate {
    func backAction() {
        viewModel.pop(animated: true)
    }
}

