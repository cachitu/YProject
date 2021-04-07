//
//  YWalletColletPhraseVC.swift
//  YProjet
//
//  Created by Calin Chitu on 07.04.2021.
//

import UIKit

class YWalletColletPhraseVC: UIViewController {

    @IBOutlet weak var networkLogoImage: UIImageView!
    @IBOutlet weak var phraseTextView: UITextView!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBAction func copyPhraseAction(_ sender: Any) {
    }
    
    @IBAction func continueAction(_ sender: Any) {
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = 10
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
