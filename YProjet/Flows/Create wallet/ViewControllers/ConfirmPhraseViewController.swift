//
//  YWalletConfirmPhrase.swift
//  YProjet
//
//  Created by Calin Chitu on 07.04.2021.
//

import UIKit

class ConfirmPhraseViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    @IBOutlet weak var networkLogoImage: UIImageView!
    @IBOutlet weak var confirmPhraseButton: UIButton!
    @IBOutlet weak var navigationView: NavigationView!
        
    @IBAction func confirmAction(_ sender: Any) {
        
    }

    var viewModel: NewWalletViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmPhraseButton.layer.cornerRadius = 10
        navigationView.viewDelegate = self
        configureUI()
    }

    private func configureUI() {
        navigationView.title = "New Wallet".localized
        navigationView.configure(showBackButton: true)
    }

    func bindViewModel() {}
}

extension ConfirmPhraseViewController: NavigationViewDelegate {
    func backAction() {
        viewModel.pop(animated: true)
    }
}
