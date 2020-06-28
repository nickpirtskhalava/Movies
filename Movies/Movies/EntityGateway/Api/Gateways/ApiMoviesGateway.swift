//
//  ApiMoviesGateway.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation


protocol ApiMoviesGateway: MoviesGateway {
    
}

class ApiMoviesGatewayImpl: ApiMoviesGateway {
    
    let apiClient: ApiClient
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchMovies(for type: MovieCategory, completionHandler: @escaping FetchMoviesEntityGatewayCompletionHandler) {
        apiClient.execute(request: type.request) { (result: Result<ApiResponse<IMDBApiResponse<[ApiMovie]>>, Error>) in
            switch result {
            case let .success(response):
                let movies = response.entity.results.map { $0.movie }
                completionHandler(.success(movies))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
}
