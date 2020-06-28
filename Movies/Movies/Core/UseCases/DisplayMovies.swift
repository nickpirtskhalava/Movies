//
//  DisplayTopRatedMovies.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

typealias DisplayMoviesUseCaseCompletionHandler = (_ movies: Result<[Movie], Error>) -> Void

protocol DisplayMoviesUseCase {
    func displayMovies(for category: MovieCategory, completionHandler: @escaping DisplayMoviesUseCaseCompletionHandler)
}

class DisplayMoviesUseCaseImpl: DisplayMoviesUseCase {
    
    let moviesGateway: MoviesGateway
    init(moviesGateway: MoviesGateway) {
        self.moviesGateway = moviesGateway
    }
    
    func displayMovies(for category: MovieCategory, completionHandler: @escaping DisplayMoviesUseCaseCompletionHandler) {
        self.moviesGateway.fetchMovies(for: category) { (result) in
            completionHandler(result)
        }
    }
}
