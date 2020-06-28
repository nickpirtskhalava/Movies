//
//  MovieDetailsConfigurator.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation
import CoreData


protocol MovieDetailsConfigurator {
    func configure(for controller: MovieDetailsController)
}

class MovieDetailsConfiguratorImpl: MovieDetailsConfigurator {
    
    let movie: Movie
    init(movie: Movie) {
        self.movie = movie
    }

    func configure(for controller: MovieDetailsController) {
        let viewContext = CoreDataStackImplementation.sharedInstance.persistentContainer.viewContext
        let gateway = CoreDataMoviesGateway.init(viewContext: viewContext)
        let useCase = AddMovieUseCaseImpl.init(gateway: gateway)
        let presenter = MovieDetailsPresenterImpl.init(
            view: controller, useCase: useCase, movie: movie)
        controller.presenter = presenter
    }
}
