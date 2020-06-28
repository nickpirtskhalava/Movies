//
//  MoviesCollectionConfigurator.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/27/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation
import CoreData

protocol MoviesConfigurator {
    func configure(for controller: MoviesController)
}

class MoviesConfiguratorImpl: MoviesConfigurator {
    
    func configure(for controller: MoviesController) {
        
        let apiClient = ApiClientImplementation(
            urlSessionConfiguration: URLSessionConfiguration.default,
            completionHandlerQueue: OperationQueue.main)
        let viewContext = CoreDataStackImplementation.sharedInstance.persistentContainer.viewContext
        let apiGateway = ApiMoviesGatewayImpl.init(apiClient: apiClient)
        let localPersistanceGateway = CoreDataMoviesGateway.init(viewContext: viewContext)
        let gateway = CacheMoviesGateway.init(apiMoviesGateway: apiGateway, localPersistenceMoviesGateway: localPersistanceGateway)
        let useCase = DisplayMoviesUseCaseImpl.init(moviesGateway: gateway)
        let router = MoviesRouterImpl(moviesController: controller)
        let presenter = MoviesPresenterImpl.init(
            view: controller, router: router,
            useCase: useCase)
        controller.presenter = presenter
    }
}
