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
    @IBOutlet weak var tableView: UITableView!

    // Delegation View Outlets
    @IBOutlet weak var delegationView: UIView!
    @IBOutlet weak var delegationViewHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var delegatedLabel: UILabel!
    @IBOutlet weak var rewardsLabel: UILabel!
    @IBOutlet weak var delegatedValueLabel: UILabel!
    @IBOutlet weak var rewardsValueLabel: UILabel!

    @IBOutlet weak var claimButton: CustomButton!
    @IBOutlet weak var summaryButton: CustomButton!

    @IBAction func claimAction(_ sender: Any) {
    }

    @IBAction func summaryAction(_ sender: Any) {
        viewModel.showSummary()
    }

    // Order By View Outlets
    @IBOutlet weak var validatorsLabel: UILabel!
    @IBOutlet weak var orderByLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    @IBAction func orderAction(_ sender: UIButton) {

    }

    // TODO (for testing UI)
    var hasDelegations: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.viewDelegate = self
        setupTableView()
        configureUI()
    }

    private func configureUI() {
        navigationView.title = "Staking".localized
        navigationView.configure(showNotificationButton: true)

        // Delegation View
        delegationView.isHidden = !hasDelegations
        delegationViewHeightContraint.constant = hasDelegations ? 190.0 : 0.0
        delegatedLabel.text = "Delegated".localized
        rewardsLabel.text = "Rewards".localized

        claimButton.setTitle("Claim rewards".localized, for: .normal)
        claimButton.style = .bordered()
        
        summaryButton.setTitle("Summary".localized, for: .normal)
        summaryButton.style = .withOpacity()

        // Order By View
        validatorsLabel.text = "Validators".localized
        orderByLabel.text = "Order by".localized + ": "

        // TODO: need to define order values
        orderButton.setTitle("Delegation return".localized.addRightWhitespaces(), for: .normal)
    }

    private func setupTableView() {
        tableView.registerNib(StakingTableViewCell.self)
    }

    func bindViewModel() {}
}

// MARK: - DataSource & Delegates
extension StakingViewController: UITableViewDataSource, UITableViewDelegate {

    enum Constants {
        static let rowHeight: CGFloat = 70.0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //viewModel.dataSource.object[section].numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return viewModel.dataSource.object[indexPath.section].cellForRow(tableView, indexPath: indexPath, viewDelegate: self)

        let cell = tableView.dequeue(type: StakingTableViewCell.self, indexPath: indexPath)
        cell.configure()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.showValidatorDetails()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowHeight
    }
}

extension StakingViewController: NavigationViewDelegate {

}

