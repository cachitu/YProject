//
//  YWalletConfirmPhrase.swift
//  YProjet
//
//  Created by Calin Chitu on 07.04.2021.
//

import UIKit

class ConfirmPhraseViewController: UIViewController {

    @IBOutlet weak var networkLogoImage: UIImageView!
    @IBOutlet weak var confirmPhraseButton: UIButton!
    
    @IBAction func backAction(_ sender: Any) {

    }
    
    @IBAction func confirmAction(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmPhraseButton.layer.cornerRadius = 10
    }
}
