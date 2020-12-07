//
//  PhotosHttpService.swift
//  UnsplashPhoto
//
//  Created by Admin on 18.11.2020.
//

import Alamofire

final class PhotosHttpService: HttpService {
    var sessionManager: Session = Session.default
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        sessionManager.request(urlRequest).validate(statusCode: 200..<400)
    }
}
