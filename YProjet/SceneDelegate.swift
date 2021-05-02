//
//  SceneDelegate.swift
//  YProjet
//
//  Created by Calin Chitu on 06.04.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private(set) var appCoordinator: AppCoordinator!
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let coordinator = AppCoordinator(window: window!)
        appCoordinator = coordinator
        coordinator.start()
        
        // Determine the user activity from a new connection or from a session's state restoration.
        guard let userActivity = connectionOptions.userActivities.first ?? session.stateRestorationActivity else { return }
        if let userInfo = userActivity.userInfo {
            // Decode the selected tab bar controller tab from the userInfo.
            if let selectedTab = userInfo[SceneDelegate.selectedTabKey] as? Int {
                coordinator.restoredSelectedTab = selectedTab
            }
        }
        scene.userActivity = userActivity
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        if let userActivity = window?.windowScene?.userActivity {
            userActivity.becomeCurrent()
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        if let userActivity = window?.windowScene?.userActivity {
            userActivity.resignCurrent()
        }
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

// MARK: State Restoration

extension SceneDelegate {

    /// Activity type for restoring this scene (loaded from the Info.plist).
    /// More info on: [NSUserActivity](https://developer.apple.com/documentation/foundation/nsuseractivity)
    static let MainSceneActivityType = { () -> String in
        let activityTypes = Bundle.main.infoDictionary?["NSUserActivityTypes"] as? [String]
        guard let firstActivity = activityTypes?.first else {
            fatalError("Info.plist should have at least one user activity!")
        }
        return firstActivity
    }

    // State restoration keys:
    static let selectedTabKey = "selectedTab" // The selected tab bar item.

    /** This is the NSUserActivity that you use to restore state when the Scene reconnects.
        It can be the same activity that you use for handoff or spotlight, or it can be a separate activity
        with a different activity type and/or userInfo.

        This object must be lightweight. You should store the key information about what the user was doing last.

        After the system calls this function, and before it saves the activity in the restoration file, if the returned NSUserActivity has a
        delegate (NSUserActivityDelegate), the function userActivityWillSave calls that delegate. Additionally, if any UIResponders have the activity
        set as their userActivity property, the system calls the UIResponder updateUserActivityState function to update the activity.
        This happens synchronously and ensures that the system has filled in all the information for the activity before saving it.
     */
    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        return scene.userActivity
    }
}

