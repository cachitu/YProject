//
//  KeyboardMonitor.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

class KeyboardMonitor {
    private let view: UIView!
    private let keyboardCoverSpaceChanged: (CGFloat) -> Void
    private var observer: NSObjectProtocol?

    init(with view: UIView, keyboardCoverSpaceChanged: @escaping (CGFloat) -> Void) {
        self.view = view
        self.keyboardCoverSpaceChanged = keyboardCoverSpaceChanged
        self.observer = NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillChangeFrameNotification,
            object: nil,
            queue: nil
        ) { [weak self] notification in
            guard let self = self else { return }
            self.keyboardFrameChanged(notification)
        }
    }

    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
        self.observer = nil
    }

    @objc private func keyboardFrameChanged(_ notification: Notification) {
        guard let info = notification.userInfo, let rect = info[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        let height = view.frame.size.height - view.convert(rect, from: nil).origin.y
        keyboardCoverSpaceChanged(height > 0 ? height - view.safeAreaInsets.bottom : 0)
    }
}
