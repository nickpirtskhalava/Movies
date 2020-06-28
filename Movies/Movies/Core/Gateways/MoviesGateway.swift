//
//  MoviesGateway.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

typealias FetchPopularMoviesEntityGatewayCompletionHandler = (_ books: Result<[Movie], Error>) -> Void

protocol MoviesGateway {
    func fetchPopularMovies(completionHandler: @escaping FetchPopularMoviesEntityGatewayCompletionHandler)
}
