//
//  NavigationView.swift
//  YProjet
//
//  Created by cristina.virlan on 16/05/2021.
//

import UIKit

protocol NavigationViewDelegate {
    func backAction()
    func notificationAction()
    func settingsAction()
}

extension NavigationViewDelegate {
    func backAction() {}
    func notificationAction() {}
    func settingsAction() {}
}

class NavigationView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var backButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!

    @IBAction func backAction(_ sender: Any) {
        viewDelegate?.backAction()
    }

    @IBAction func notificationsAction(_ sender: Any) {
        viewDelegate?.notificationAction()
    }

    @IBAction func settingsAction(_ sender: Any) {
        viewDelegate?.settingsAction()
    }

    var showBackButton: Bool = false {
        didSet {
            configureBackButton()
        }
    }

    var showNotificationButton: Bool = false {
        didSet {
            configureNotificationButton()
        }
    }

    var showSettingsButton: Bool = false {
        didSet {
            configureSettingsButton()
        }
    }

    var title: String? {
        didSet {
            navigationTitleLabel.text = title
        }
    }
    var viewDelegate: NavigationViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    private func nibSetup() {
        backgroundColor = .clear
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
        configure()
    }

    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: self.classForCoder)
        let view = UIView.viewFromNib(withOwner: self, bundle: bundle)
        view.frame = bounds
        return view
    }

    private func configure() {
        configureBackButton()
        configureNotificationButton()
        configureSettingsButton()
        navigationTitleLabel.font = UIFont(name: "Aeonik-Bold", size: 25.0)
        navigationTitleLabel.textColor = .white
        backgroundColor = .topBarBlue
    }

    public func configure(showBackButton: Bool = false, showNotificationButton: Bool = false, showSettingsButton: Bool = false) {
        self.showBackButton = showBackButton
        self.showNotificationButton = showNotificationButton
        self.showSettingsButton = showSettingsButton
    }

    private func configureBackButton() {
        backButtonWidthConstraint.constant = showBackButton ? 22.0 : 0.0
    }

    private func configureNotificationButton() {
        notificationButton.isHidden = !showNotificationButton
    }

    private func configureSettingsButton() {
        settingsButton.isHidden = !showSettingsButton
    }
}
