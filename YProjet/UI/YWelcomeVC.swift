//
//  YWelcomeVC.swift
//  YProjet
//
//  Created by Calin Chitu on 06.04.2021.
//

import UIKit

class YWelcomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBAction func settingsAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension YWelcomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: YWelcomeCell.cellID, for: indexPath) as! YWelcomeCell
        return cell
    }
}

extension YWelcomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         DispatchQueue.main.async {
            self.performSegue(withIdentifier: "CreateWalletSegue", sender: self)
        }
    }
}

class YWelcomeCell: UITableViewCell {
    
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let cellID = "YWelcomeCellID"
    
    override func willMove(toSuperview newSuperview: UIView?) {
        roundedView.layer.cornerRadius = 10
        roundedView.layer.shadowRadius = 5
        roundedView.layer.shadowOpacity = 0.02
    }
}
