//
//  ValidatorDetailsViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 26/05/2021.
//

import UIKit

class ValidatorDetailsViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    var viewModel: StakingViewModel!

    @IBOutlet weak var navigationView: NavigationView!
    @IBOutlet weak var tableView: UITableView!

    // Delegation View Outlets
    @IBOutlet weak var validatorImageView: UIImageView!
    @IBOutlet weak var validatorNameLabel: UILabel!
    @IBOutlet weak var validatorStatusLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressValueLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var detailsValueLabel: UILabel!

    @IBAction func delegateAction(_ sender: UIButton) {
        viewModel.delegate()
    }

    enum Sections: Int, CaseIterable {
        case details
        case commissions
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
        navigationView.title = "Staking".localized
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

    private func setupTableView() {
        tableView.registerNib(ValidatorDetailsTableViewCell.self)
        tableView.registerNib(LabelValueTableViewCell.self)
    }

    func bindViewModel() {}
}

// MARK: - DataSource & Delegates
extension ValidatorDetailsViewController: UITableViewDataSource, UITableViewDelegate {

    enum Constants {
        static let detailsRowHeight: CGFloat = 70.0
        static let commissionsRowHeight: CGFloat = 30.0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case Sections.details.rawValue:
            return 4
        case Sections.commissions.rawValue:
            return 4
        default:
            return 0
        }
        //viewModel.dataSource.object[section].numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return viewModel.dataSource.object[indexPath.section].cellForRow(tableView, indexPath: indexPath, viewDelegate: self)

        switch indexPath.section {
        case Sections.details.rawValue:
            let cell = tableView.dequeue(type: ValidatorDetailsTableViewCell.self, indexPath: indexPath)
            cell.configure()
            return cell
        case Sections.commissions.rawValue:
            let cell = tableView.dequeue(type: LabelValueTableViewCell.self, indexPath: indexPath)
            cell.configure()
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case Sections.details.rawValue:
            return Constants.detailsRowHeight
        case Sections.commissions.rawValue:
            return Constants.commissionsRowHeight
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case Sections.commissions.rawValue:
            return 10.0
        default:
            return 0.0
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension ValidatorDetailsViewController: NavigationViewDelegate {
    func backAction() {
        viewModel.pop(animated: true)
    }
}
