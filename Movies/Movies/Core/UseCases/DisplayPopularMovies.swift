//
//  DisplayTopRatedMovies.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

typealias DisplayTopRatedMoviesUseCaseCompletionHandler = (_ movies: Result<[Movie], Error>) -> Void

protocol DisplayTopRatedMoviesUseCase {
    func displayTopRatedMovies(for type: MovieType, completionHandler: @escaping DisplayTopRatedMoviesUseCaseCompletionHandler)
}

class DisplayTopRatedMoviesUseCaseImpl: DisplayTopRatedMoviesUseCase {
    
    let moviesGateway: MoviesGateway
    init(moviesGateway: MoviesGateway) {
        self.moviesGateway = moviesGateway
    }
    
    func displayTopRatedMovies(for type: MovieType, completionHandler: @escaping DisplayTopRatedMoviesUseCaseCompletionHandler) {
        self.moviesGateway.fetchMovies(for: type) { (result) in
            completionHandler(result)
        }
    }
}
