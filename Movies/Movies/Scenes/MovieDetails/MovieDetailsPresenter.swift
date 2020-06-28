//
//  MovieDetailsPresenter.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

protocol MovieDetailsView: class {
    func display(movieTitle: String)
    func display(movieImageUrl: URL?)
    func display(movieOriginalTitle: String)
    func display(movieOverView: String)
    func display(movieRating: Double)
    func display(movieReleaseDate: String)
}

protocol MovieDetailsPresenter {
    func viewDidLoad()
}

class MovieDetailsPresenterImpl: MovieDetailsPresenter {
    
    private weak var view: MovieDetailsView?
    private var movie: Movie
    
    init(view: MovieDetailsView?,
         movie: Movie) {
        self.view = view
        self.movie = movie
    }
    
    func viewDidLoad() {
        let url = URL.init(string: "\(AppUrl.ImagePath)\(movie.posterPath)")
        view?.display(movieTitle: movie.title)
        view?.display(movieImageUrl: url)
        view?.display(movieOriginalTitle: movie.originalTitle)
        view?.display(movieOverView: movie.overview)
        view?.display(movieRating: movie.voteAverage)
        view?.display(movieReleaseDate: movie.releaseDate)
    }
}
