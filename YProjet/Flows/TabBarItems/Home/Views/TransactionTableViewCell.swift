//
//  TransactionTableViewCell.swift
//  YProjet
//
//  Created by cristina.virlan on 26.01.2022.
//

import UIKit

class TransactionTableViewCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var roundedView: UIView!

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func willMove(toSuperview newSuperview: UIView?) {
        roundedView.layer.cornerRadius = 10
        roundedView.layer.shadowRadius = 5
        roundedView.layer.shadowOpacity = 0.02
    }

    // TODO
    func configure() {
        amountLabel.text = "Received 1.000000 LUNA"
        addressLabel.text = "from terracnalrc…c38cul"
        dateLabel.text = "FEB 23, 2021 2:44:53 PM" // TODO: format date like this
        isUserInteractionEnabled = false
    }
}
