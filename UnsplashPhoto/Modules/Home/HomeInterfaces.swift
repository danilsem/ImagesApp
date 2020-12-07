//
//  HomeInterfaces.swift
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

enum HomeRoute {
    case imageDetail(image: Photo)
}

protocol HomeWireframeInterface: WireframeInterface {
    func navigate(to route: HomeRoute)
}

protocol HomeViewInterface: ViewInterface {
}

protocol HomePresenterInterface: PresenterInterface {
    func configure(with output: Home.ViewOutput) -> Home.ViewInput
}

protocol HomeInteractorInterface: InteractorInterface {
    var photosObservable: Observable<[Photo]> { get }
    var photosCount: Int { get }
    func loadMorePhotos()
}

enum Home {

    struct ViewOutput {
        let loadMorePhotos: Observable<Int>
        let photoSelected: Driver<Photo>
    }

    struct ViewInput {
        let photosDriver: Driver<[Photo]>
    }

}
