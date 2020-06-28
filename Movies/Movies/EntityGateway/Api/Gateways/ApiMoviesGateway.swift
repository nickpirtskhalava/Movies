//
//  ApiMoviesGateway.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation


class ApiMoviesGatewayImpl: MoviesGateway {
    
    let apiClient: ApiClient
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchPopularMovies(completionHandler: @escaping FetchPopularMoviesEntityGatewayCompletionHandler) {
        let request = ApiPopularMoviesRequest()
        apiClient.execute(request: request) { (result: Result<ApiResponse<IMDBApiResponse<[ApiMovie]>>, Error>) in
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
