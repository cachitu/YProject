//
//  YWalletCreateVC.swift
//  YProjet
//
//  Created by Calin Chitu on 07.04.2021.
//

import UIKit

class YWalletCreateVC: UIViewController {

    @IBOutlet weak var networkLogoImageView: UIImageView!
    @IBOutlet weak var networkNameLabel: UILabel!
    @IBOutlet weak var createView: UIView!
    @IBOutlet weak var importView: UIView!
    @IBOutlet weak var watchView: UIView!
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView.layer.cornerRadius = 10
        importView.layer.cornerRadius = 10
        watchView.layer.cornerRadius = 10
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
