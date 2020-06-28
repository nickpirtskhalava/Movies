//
//  MovieDetailsPresenter.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

protocol MovieDetailsView: class {
    
}

protocol MovieDetailsPresenter {
    
}

class MovieDetailsPresenterImpl: MovieDetailsPresenter {
    
    private weak var view: MovieDetailsView?
    private var movie: Movie
    
    init(view: MovieDetailsView?,
         movie: Movie) {
        self.view = view
        self.movie = movie
    }
}
