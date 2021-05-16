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

    @IBAction func confirmButtonAction(_ sender: Any) {
        viewModel.confirmPhrase()
    }
    
    @IBAction func copyPhraseAction(_ sender: Any) {
    }

    @IBAction func backAction(_ sender: Any) {
        viewModel.pop(animated: true)
    }

    var viewModel: NewWalletViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        confirmButton.setTitle("Collect Phrase Button Title".localized, for: .normal)
        confirmButton.style = CustomButton.Style.generic(fillColor: .buttonGreen, textColor: .white)
    }

    func bindViewModel() {}
}
