//
//  HttpServiceError.swift
//  UnsplashPhoto
//
//  Created by Admin on 18.11.2020.
//

import Foundation

enum HttpServiceError: Error {
    case apiError
    case internalError
    case decodeError
}
