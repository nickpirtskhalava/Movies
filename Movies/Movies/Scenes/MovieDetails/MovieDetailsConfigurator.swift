//
//  MovieDetailsConfigurator.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation



protocol MovieDetailsConfigurator {
    func configure(for controller: MovieDetailsController)
}

class MovieDetailsConfiguratorImpl: MovieDetailsConfigurator {
    
    let movie: Movie
    init(movie: Movie) {
        self.movie = movie
    }

    func configure(for controller: MovieDetailsController) {
        let presenter = MovieDetailsPresenterImpl.init(
            view: controller, movie: movie)
        controller.presenter = presenter
    }
}
