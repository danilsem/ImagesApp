//
//  PhotosRouter.swift
//  UnsplashPhoto
//
//  Created by Admin on 18.11.2020.
//

import Alamofire

enum PhotosRouter: HttpRouter {
    case photos(page: Int = 1)
    
    var baseURL: String {
        return "https://api.unsplash.com"
    }
    
    var path: String {
        switch self {
        case .photos:
            return "/photos"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters? {
        switch self {
        case .photos(let page):
            return [
                "page": "\(page)",
                "client_id": "\(APIKeys.unsplash)"
            ]
        }
    }
}
