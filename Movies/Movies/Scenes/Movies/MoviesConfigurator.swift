//
//  MoviesCollectionConfigurator.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/27/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

protocol MoviesConfigurator {
    func configure(for controller: MoviesController)
}

class MoviesConfiguratorImpl: MoviesConfigurator {
    
    func configure(for controller: MoviesController) {
        
        let apiClient = ApiClientImplementation(
            urlSessionConfiguration: URLSessionConfiguration.default,
            completionHandlerQueue: OperationQueue.main)
        let gateway = ApiMoviesGatewayImpl.init(apiClient: apiClient)
        let useCase = DisplayPopularMoviesUseCaseImpl.init(moviesGateway: gateway)
        let presenter = MoviesPresenterImpl.init(
            view: controller,
            useCase: useCase)
        controller.presenter = presenter
    }
}
