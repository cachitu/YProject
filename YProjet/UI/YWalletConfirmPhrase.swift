//
//  YWalletConfirmPhrase.swift
//  YProjet
//
//  Created by Calin Chitu on 07.04.2021.
//

import UIKit

class YWalletConfirmPhrase: UIViewController {

    @IBOutlet weak var networkLogoImage: UIImageView!
    @IBOutlet weak var confirmPhraseButton: UIButton!
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmPhraseButton.layer.cornerRadius = 10
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
