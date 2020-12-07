//
//  Photo.swift
//  UnsplashPhoto
//
//  Created by Admin on 18.11.2020.
//

import Foundation

struct Photo: Codable {
    let id: String
    let createdAt: Date
    let color: String?
    let photoDescription: String?
    let altDescription: String?
    let urls: Urls
    let likes: Int
    
    enum CodingKeys: String, CodingKey {
        case id, color, urls, likes
        case createdAt = "created_at"
        case photoDescription = "description"
        case altDescription = "alt_description"
    }
    
    struct Urls: Codable {
        let raw: String
        let full: String
        let regular: String
        let thumb: String
    }
}
