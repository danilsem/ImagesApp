//
//  UnsplashService.swift
//  UnsplashPhoto
//
//  Created by Admin on 18.11.2020.
//

import RxSwift

final class UnsplashService: PhotosAPI {
    
    let httpService = PhotosHttpService()
    
    func getPhotos(page: Int) -> Single<[Photo]> {
        return Single<[Photo]>.create { [httpService] (single) -> Disposable in
            
            do {
                try PhotosRouter.photos(page: page)
                    .request(using: httpService)
                    .responseJSON { (dataResponse) in
                        guard let data = dataResponse.data else {
                            single(.failure(HttpServiceError.apiError))
                            return
                        }
                        
                        do {
                            let decoder = JSONDecoder()
                            decoder.dateDecodingStrategy = .iso8601
                            let response = try decoder.decode([Photo].self, from: data)
                            single(.success(response))
                        }
                        catch {
                            print(error)
                            single(.failure(HttpServiceError.decodeError))
                        }
                    }
            }
            catch {
                single(.failure(HttpServiceError.apiError))
            }
            
            return Disposables.create()
        }
    }
}
