//
//  PhotosAPI.swift
//  UnsplashPhoto
//
//  Created by Admin on 18.11.2020.
//

import RxSwift

protocol PhotosAPI {
    func getPhotos(page: Int) -> Single<[Photo]>
}
