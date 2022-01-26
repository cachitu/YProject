//
//  GovDetailsViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import UIKit

class GovDetailsViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    var viewModel: GovViewModel!
    @IBOutlet weak var navigationView: NavigationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var voteButton: CustomButton!

    @IBAction func voteAction(_ sender: Any) {
        presentVotingOptions()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.viewDelegate = self
        configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = false
    }

    // TODO
    func configureUI() {
        navigationView.title = "#25".localized
        navigationView.configure(showBackButton: true, showNotificationButton: true)
        titleLabel.text = "Luna Mission - Funding $Atom"
        descriptionTextView.text = "The Cosmos Hub (ATOM) community is requesting a community pool spend amount of 129,208 ATOM in order to implement a comprehensive ATOM marketing plan that will be executed in collaboration with AiB (Tendermint).\nThe distribution of funds will be administered by 5 community members, that have been carefully selected by the community via the Cosmos governance working group to administer the marketing plan and release funds to either AiB that will act as a liaison between Cosmos Hub community and third parties or directly to parties that will be in charge of executing the marketing plan based on a majority multisignature approval. At least 3 members will have to approve each milestone-spend for it to be released to AiB based on the expected proposal scope &completion."

        voteButton.setTitle("Vote".localized, for: .normal)
        voteButton.style = CustomButton.Style.generic(fillColor: .customBlue, textColor: .white)
    }

    func bindViewModel() {}

    private func presentVotingOptions() {
        
        // TODO: proposal title "Luna Mission - Funding $Atom"
        let alert = UIAlertController(title: "Vote".localized + " Luna Mission - Funding $Atom", message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Yes".localized, style: .default , handler: { (UIAlertAction) in
            print("User click Yes")
            // TODO
        }))

        alert.addAction(UIAlertAction(title: "No".localized, style: .default , handler: { (UIAlertAction) in
            print("User click No")
            // TODO
        }))

        alert.addAction(UIAlertAction(title: "Abstain", style: .cancel, handler: { (UIAlertAction) in
            print("User click Abstain")
            // TODO
        }))

        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}

extension GovDetailsViewController: NavigationViewDelegate {
    func backAction() {
        viewModel.pop(animated: true)
    }
}
