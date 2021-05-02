//
//  MainTabBarViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

class MainTabBarViewController: UITabBarController, StoryboardIdentifiable {

    private var selectedTab: Tab = .home

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.tabBar.tintColor = .interactiveBlue
        self.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUserActivity()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // This view controller is going away, no more user activity to track.
        view.window?.windowScene?.userActivity = nil
    }

    func selectTab(_ tab: Tab) {
        selectedIndex = tab.rawValue
        selectedTab = tab
    }

    /** Update the user activity for this view controller's scene.
     viewDidAppear calls this upon initial presentation.  The tabBarController.didSelect delegate also calls it.
     */
    func updateUserActivity() {
        var currentUserActivity = view.window?.windowScene?.userActivity
        if currentUserActivity == nil {
            /** Note: You must include the activityType string below in your Info.plist file under the `NSUserActivityTypes` array.
                More info: https://developer.apple.com/documentation/foundation/nsuseractivity
            */
            currentUserActivity = NSUserActivity(activityType: SceneDelegate.MainSceneActivityType())
        }

        // Add the tab bar selection to the user activity.
        currentUserActivity?.addUserInfoEntries(from: [SceneDelegate.selectedTabKey: selectedTab.rawValue])

        view.window?.windowScene?.userActivity = currentUserActivity
    }
}

extension MainTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        defer {
            selectedTab = Tab(rawValue: tabBarController.selectedIndex) ?? .home
            updateUserActivity() // Remember this tab selection as part of the user activity for scene-based state restoration.
        }
        if let viewController = (viewController as? BaseNavigationController)?.viewControllers.first as? ScrollableToTop,
        selectedTab.rawValue == tabBarController.selectedIndex {
            viewController.scrollToTop(animated: true)
        }
        if let viewController = (viewController as? BaseNavigationController)?.viewControllers.first as? RefreshableTabViewController {
            viewController.refreshControllerContent()
        }
    }
}
