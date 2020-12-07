//
//  SceneDelegate.swift
//  UnsplashPhoto
//
//  Created by Admin on 18.11.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
        navigationController.setRootWireframe(HomeWireframe())
        
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
    }
}

