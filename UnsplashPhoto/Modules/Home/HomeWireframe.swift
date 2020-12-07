//
//  HomeWireframe.swift
//  UnsplashPhoto
//
//  Created by Admin on 18.11.2020.
//  Copyright (c) 2020 Danil Semenov. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

final class HomeWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Home", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: HomeViewController.self)
        super.init(viewController: moduleViewController)

        let interactor = HomeInteractor(photosService: UseCases.photoService)
        let presenter = HomePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension HomeWireframe: HomeWireframeInterface {
    func navigate(to route: HomeRoute) {
        switch route {
        case .imageDetail(let image):
            let wireframe = ImageDetailsWireframe(image: image)
            self.navigationController?.pushWireframe(wireframe)
        }
    }
}

private extension HomeWireframe {
    func navigateToImageDetail() {
        
    }
}