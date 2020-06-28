//
//  CacheMoviesGateway.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation


class CacheMoviesGateway: MoviesGateway {
    
    let apiMoviesGateway: ApiMoviesGateway
    let localPersistenceMoviesGateway: LocalPersistenceMoviesGateway
    
    init(apiMoviesGateway: ApiMoviesGateway,
         localPersistenceMoviesGateway: LocalPersistenceMoviesGateway) {
        self.apiMoviesGateway = apiMoviesGateway
        self.localPersistenceMoviesGateway = localPersistenceMoviesGateway
    }
    
    func fetchMovies(for type: MovieCategory, completionHandler: @escaping FetchMoviesEntityGatewayCompletionHandler) {
        switch type {
        case .popular, .topRated:
            apiMoviesGateway.fetchMovies(
                for: type,
                completionHandler: completionHandler)
        default:
            localPersistenceMoviesGateway.fetchMovies(
                for: type,
                completionHandler: completionHandler)
        }
    }
}
