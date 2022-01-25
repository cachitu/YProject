//
//  StakingSummaryViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 25.01.2022.
//

import UIKit

class StakingSummaryViewController: BaseViewController, BindableType, StoryboardIdentifiable {
    
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

    enum Sections: Int, CaseIterable {
        case delegationList
        case delegationHeader
        case validatorList
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
        setupTableView()
        configureUI()
    }

    private func configureUI() {
        navigationView.title = "Summary".localized
        navigationView.configure(showBackButton: true, showNotificationButton: true)

        // Delegation View
        delegatedLabel.text = "Delegated".localized
        rewardsLabel.text = "Rewards".localized
    }

    private func setupTableView() {
        tableView.registerNib(StakingTableViewCell.self)
        tableView.registerNib(StakingDelegateTableViewCell.self)
    }

    func bindViewModel() {}

    
}

// MARK: - DataSource & Delegates
extension StakingSummaryViewController: UITableViewDataSource, UITableViewDelegate {

    enum Constants {
        static let delegationsRowHeight: CGFloat = 70.0
        static let delegationHeaderRowHeight: CGFloat = 60.0
        static let validatorsRowHeight: CGFloat = 45.0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case Sections.delegationList.rawValue:
            return 4
        case Sections.delegationHeader.rawValue:
            return 1
        case Sections.validatorList.rawValue:
            return 2
        default:
            return 0
        }
        //viewModel.dataSource.object[section].numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return viewModel.dataSource.object[indexPath.section].cellForRow(tableView, indexPath: indexPath, viewDelegate: self)

        switch indexPath.section {
        case Sections.delegationList.rawValue:
            let cell = tableView.dequeue(type: StakingTableViewCell.self, indexPath: indexPath)
            cell.configure()
            return cell
        case Sections.delegationHeader.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DelegationHeaderCell", for: indexPath)
            return cell
        case Sections.validatorList.rawValue:
            let cell = tableView.dequeue(type: StakingDelegateTableViewCell.self, indexPath: indexPath)
            cell.configure()
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case Sections.delegationList.rawValue:
            return Constants.delegationsRowHeight
        case Sections.delegationHeader.rawValue:
            return Constants.delegationHeaderRowHeight
        case Sections.validatorList.rawValue:
            return Constants.validatorsRowHeight
        default:
            return 0
        }
    }
}

extension StakingSummaryViewController: NavigationViewDelegate {
    func backAction() {
        viewModel.pop(animated: true)
    }
}
