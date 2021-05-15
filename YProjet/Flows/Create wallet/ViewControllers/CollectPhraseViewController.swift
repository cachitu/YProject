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
    @IBOutlet weak var continueButton: UIButton!

    @IBAction func copyPhraseAction(_ sender: Any) {
    }
    
    @IBAction func continueAction(_ sender: Any) {
        viewModel.confirmPhrase()
    }
    
    @IBAction func backAction(_ sender: Any) {
        viewModel.pop(animated: true)
    }

    var viewModel: NewWalletViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.layer.cornerRadius = 10
    }

    func bindViewModel() {}
}
