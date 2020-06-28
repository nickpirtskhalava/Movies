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
    func display(state: FavoriteState)
}

protocol MovieDetailsPresenter {
    func viewDidLoad()
    func didTapAddMovie()
}

class MovieDetailsPresenterImpl: MovieDetailsPresenter {
    
    private weak var view: MovieDetailsView?
    private let addMovie: AddMovieUseCase
    private let coreDataGateway: CoreDataMoviesGateway
    private let movie: Movie
    
    init(view: MovieDetailsView?,
         addMovie: AddMovieUseCase,
         gateway: CoreDataMoviesGateway,
         movie: Movie) {
        
        self.view = view
        self.movie = movie
        self.addMovie = addMovie
        self.coreDataGateway = gateway
    }
    
    func viewDidLoad() {
        configureFavoriteButtonState()
        
        let url = URL.init(string: "\(AppUrl.ImagePath)\(movie.posterPath)")
        view?.display(movieTitle: movie.title)
        view?.display(movieImageUrl: url)
        view?.display(movieOriginalTitle: movie.originalTitle)
        view?.display(movieOverView: movie.overview)
        view?.display(movieRating: movie.voteAverage)
        view?.display(movieReleaseDate: movie.releaseDate)
    }
    
    func didTapAddMovie() {
        addMovie.add(movie: movie)
        view?.display(state: .added)
    }
}
extension MovieDetailsPresenterImpl {
    
    func configureFavoriteButtonState() {
        coreDataGateway.fetchMovies(for: .favorite) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case let .success(movies):
                let movieAlreadyInDatabase = movies.contains { $0.id == self.movie.id }
                self.view?.display(state: movieAlreadyInDatabase ? .added : .canAdd)
                break
            case .failure:
                break
            }
        }
    }
}
