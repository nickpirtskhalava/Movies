//
//  MoviesCollectionConfigurator.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/27/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

protocol MovieCollectionConfigurator {
    func configure(for controller: MovieCollectionController)
}

class MovieCollectionConfiguratorImpl: MovieCollectionConfigurator {
    
    func configure(for controller: MovieCollectionController) {
        
        let apiClient = ApiClientImplementation(
            urlSessionConfiguration: URLSessionConfiguration.default,
            completionHandlerQueue: OperationQueue.main)
        let gateway = ApiMoviesGatewayImpl.init(apiClient: apiClient)
        let useCase = DisplayPopularMoviesUseCaseImpl.init(moviesGateway: gateway)
        let presenter = MovieCollectionPresenterImpl.init(useCase: useCase)
        controller.presenter = presenter
    }
}
