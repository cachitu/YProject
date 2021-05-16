//
//  YWalletColletPhraseVC.swift
//  YProjet
//
//  Created by Calin Chitu on 07.04.2021.
//

import UIKit

class CollectPhraseViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    @IBOutlet weak var networkLogoImage: UIImageView!
    @IBOutlet weak var phraseTextView: UITextView!
    @IBOutlet weak var confirmButton: CustomButton!
    @IBOutlet weak var navigationView: NavigationView!

    @IBAction func confirmButtonAction(_ sender: Any) {
        viewModel.confirmPhrase()
    }
    
    @IBAction func copyPhraseAction(_ sender: Any) {
    }

    var viewModel: NewWalletViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        navigationView.viewDelegate = self
    }

    private func configureUI() {
        confirmButton.setTitle("Collect Phrase Button Title".localized, for: .normal)
        confirmButton.style = CustomButton.Style.generic(fillColor: .buttonGreen, textColor: .white)
        navigationView.title = "New Wallet".localized
        navigationView.configure(showBackButton: true)
    }

    func bindViewModel() {}
}

extension CollectPhraseViewController: NavigationViewDelegate {
    func backAction() {
        viewModel.pop(animated: true)
    }
}
