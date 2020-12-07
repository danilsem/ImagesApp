//
//  PhotoViewModel.swift
//  UnsplashPhoto
//
//  Created by Admin on 18.11.2020.
//

import Foundation

final class PhotoViewModel {
    private var thumbUrlString: String
    var thumbUrl: URL? {
        URL(string: thumbUrlString)
    }
    
    init(photo: Photo) {
        thumbUrlString = photo.urls.thumb
    }
}
