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
    
    @IBAction func backAction(_ sender: Any) {
        viewModel.pop(animated: true)
    }
    
    @IBAction func confirmAction(_ sender: Any) {
        
    }

    var viewModel: NewWalletViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmPhraseButton.layer.cornerRadius = 10
    }

    func bindViewModel() {}
}
