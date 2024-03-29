//
//  SceneDelegate.swift
//  FetchDessertsUIKit
//
//  Created by Jonathan Paul on 1/16/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let injector = Injector()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = configureNavigationController()
        window?.makeKeyAndVisible()
    }

    func configureNavigationController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: DessertListScreenViewController(injector: injector))
        navigationController.navigationBar.tintColor = UIColor(resource: .accent)
        return navigationController
    }
}

