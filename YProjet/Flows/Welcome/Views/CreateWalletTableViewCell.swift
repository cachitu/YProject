//
//  CreateWalletCell.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

class CreateWalletTableViewCell: UITableViewCell {

    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    static let cellID = "CreateWalletCellID"

    override func willMove(toSuperview newSuperview: UIView?) {
        roundedView.layer.cornerRadius = 10
        roundedView.layer.shadowRadius = 5
        roundedView.layer.shadowOpacity = 0.02
    }
}
