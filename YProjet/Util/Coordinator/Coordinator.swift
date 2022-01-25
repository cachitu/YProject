//
//  Coordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

class Coordinator {
    weak var parentCoordinator: Coordinator?

    let navigationController: BaseNavigationController

    private var currentViewController: UIViewController? {
        guard let presented = navigationController.viewControllers.first?.presentedViewController else {
            return navigationController.viewControllers.first
        }
        return presented
    }

    // The parentCoordinator should be nil only on AppCoordinator. Otherwise you should pass a value
    init(parentCoordinator: Coordinator?, navigationController: BaseNavigationController = BaseNavigationController()) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
    }

    func start() {
        assertionFailure("Start should be implemented in child")
    }

    func childCoordinatorDidFinish(coordinator: Coordinator) {
        // "childCoordinatorDidFinish not implemented"
    }

    func transition(to scene: Scene, type: SceneTransitionType, animated: Bool, completion: (() -> Void)? = nil) {
        let viewController = scene.viewController()
        switch type {
        case .navigationRoot:
            navigationController.setViewControllers([viewController], animated: animated) {
                completion?()
            }
        case .push:
            navigationController.pushViewController(viewController: viewController,
                                                    animated: animated,
                                                    completion: completion)
        case .modal(let type):
            viewController.modalPresentationStyle = type
            currentViewController?.present(viewController, animated: animated) {
                completion?()
            }
        case .alert:
            currentViewController?.present(viewController, animated: animated) {
                completion?()
            }
        case .presentCoordinator:
            presentCoordinator(with: viewController, animated: animated, completion: completion, with: .fullScreen)
        case .presentCoordinatorOverCurrentContext:
            presentCoordinator(with: viewController, animated: animated, completion: completion, with: .overFullScreen)
        }
    }

    private func presentCoordinator(with viewController: UIViewController,
                                    animated: Bool,
                                    completion: (() -> Void)? = nil,
                                    with modalPresentationStyle: UIModalPresentationStyle) {
        navigationController.setViewControllers([viewController], animated: animated) { [weak self] in
            if let self = self, let parent = self.parentCoordinator, !self.navigationController.isBeingPresented {
                let coordinatorNavigationController = self.navigationController
                coordinatorNavigationController.modalPresentationStyle = modalPresentationStyle
                parent.currentViewController?.present(coordinatorNavigationController, animated: animated, completion: completion)
            } else {
                completion?()
            }
        }
    }

    func pop(animated: Bool, completion: (() -> Void)?) {

        if currentViewController?.presentingViewController != nil {
            currentViewController?.dismiss(animated: animated, completion: completion)

        } else if let navigationController = currentViewController?.navigationController {
            if currentViewController?.navigationController?.presentedViewController != nil {
                 // modalEmbeddedNavigation
                currentViewController?.navigationController?.dismiss(animated: animated) {
                    completion?()
                }
            } else if navigationController.popViewController(animated: animated, completion: completion) == nil {
                navigationController.presentedViewController?.dismiss(animated: animated, completion: completion)
            }
        } else {
            print("Not a modal, no navigation controller: can't navigate back from \(String(describing: currentViewController))")
        }
    }

    func popToRoot(animated: Bool, completion: (() -> Void)?) {

        if currentViewController?.presentingViewController != nil {
            currentViewController?.dismiss(animated: animated, completion: completion)

        } else if let navigationController = currentViewController?.navigationController {
            navigationController.popToRootViewController(animated: animated)
        } else {
            print("Not a modal, no navigation controller: can't navigate back from \(String(describing: currentViewController))")
        }
    }

    func flowFinished() {
        assertionFailure("Flow finished not implemented")
    }

}

extension Coordinator {
    /// Recursively find a coordinator in parent hierarchy. For example, you can access TabBarCoordinator to switch tabs or
    /// creating complex hierarchies from parents
    func findParentCoordinator<T: Coordinator>() -> T? {
        return self as? T ?? self.parentCoordinator?.findParentCoordinator()
    }
    /// Property used to reach the main TabBarCoordinator only from a child coordinator
    var mainTabBarCoordinator: TabBarCoordinator {
        let coordinator: TabBarCoordinator? = self.findParentCoordinator()
        guard let tabBarCoordinator = coordinator else {
            fatalError("Trying to reach TabBarCoordinator from outside of main tabBar hierarchy!")
        }
        return tabBarCoordinator
    }
}
