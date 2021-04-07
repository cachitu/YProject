//
//  YWalletWatchVC.swift
//  YProjet
//
//  Created by Calin Chitu on 07.04.2021.
//

import UIKit

class YWalletWatchVC: UIViewController {

    @IBOutlet weak var networkLogoImage: UIImageView!
    @IBOutlet weak var networkLabel: UILabel!
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
