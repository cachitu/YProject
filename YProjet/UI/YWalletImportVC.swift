//
//  WalletImportVC.swift
//  YProjet
//
//  Created by Calin Chitu on 07.04.2021.
//

import UIKit

class YWalletImportVC: UIViewController {

    @IBOutlet weak var networkImageLogo: UIImageView!
    @IBOutlet weak var mnemonicTextView: UITextView!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = 10
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
