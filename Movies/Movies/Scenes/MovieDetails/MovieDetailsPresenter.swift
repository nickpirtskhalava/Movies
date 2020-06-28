//
//  MovieDetailsPresenter.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

struct MovieDetailsViewModel {
    var movieTitle: String
    var movieImageUrl: URL?
    var movieOriginalTitle: String
    var movieOverView: String
    var movieRating: Double
    var movieReleaseDate: String
}

protocol MovieDetailsView: class {
    func display(data: MovieDetailsViewModel)
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
        view?.display(data: movie.detailsViewModel)
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
