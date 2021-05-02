//
//  BaseViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import RxSwift
import UIKit

class BaseViewController: UIViewController {

    private var keyboardMonitor: KeyboardMonitor?
    let disposeBag = DisposeBag()

    var isKeyboardVisible: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        keyboardMonitor = nil
    }

    /// Listens to keyboard manager and calls `keyboardChanged`  with keyboardHeight
    /// - Parameter keyboardChanged: callback that tells that the keyboard height was changed
    func listenKeyboardChanges(animated: Bool = true, keyboardChanged: ((CGFloat) -> Void)? = nil) {
        keyboardMonitor = KeyboardMonitor(with: view, keyboardCoverSpaceChanged: { [weak self] keyboardHeight in
            keyboardChanged?(keyboardHeight)
            self?.updateKeyboardVisibility(visible: keyboardHeight > 0, animated: animated)
        })
    }

    private func updateKeyboardVisibility(visible: Bool, animated: Bool) {
        isKeyboardVisible = visible
        view.layoutIfNeeded()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension BaseViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        parent?.view.endEditing(true)
    }
}

