//
//  DisplayPopularMovies.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

typealias DisplayPopularMoviesUseCaseCompletionHandler = (_ movies: Result<[Movie], Error>) -> Void

protocol DisplayPopularMoviesUseCase {
    func displayPopularMovies(completionHandler: @escaping DisplayPopularMoviesUseCaseCompletionHandler)
}

class DisplayPopularMoviesUseCaseImpl: DisplayPopularMoviesUseCase {
    
    let moviesGateway: MoviesGateway
    init(moviesGateway: MoviesGateway) {
        self.moviesGateway = moviesGateway
    }
    
    func displayPopularMovies(completionHandler: @escaping DisplayPopularMoviesUseCaseCompletionHandler) {
        self.moviesGateway.fetchPopularMovies { (result) in
            completionHandler(result)
        }
    }
}
