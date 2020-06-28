//
//  MoviesCollectionRouter.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/27/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

protocol MoviesRouter {
    func presentDetailsView(for movie: Movie)
}

class MoviesRouterImpl: MoviesRouter {
    
    fileprivate weak var controller: MoviesController?
    init(moviesController: MoviesController) {
           self.controller = moviesController
       }
    
    func presentDetailsView(for movie: Movie) {
        let configurator = MovieDetailsConfiguratorImpl.init(movie: movie)
        let vc = MovieDetailsController.storyBoardInstance(with: configurator)
        controller?.navigationController?.pushViewController(vc, animated: true)
    }
}
