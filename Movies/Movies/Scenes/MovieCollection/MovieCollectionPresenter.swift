//
//  MoviesCollectionPresenter.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/27/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

protocol MovieCollectionView: class {
    
}

protocol MovieCollectionPresenter {
    func viewDidLoad()
}

class MovieCollectionPresenterImpl: MovieCollectionPresenter {
    
    fileprivate let popularMoviesUseCase: DisplayPopularMoviesUseCase
    fileprivate var dataSource: [Movie] = []
    
    init(useCase: DisplayPopularMoviesUseCase) {
        self.popularMoviesUseCase = useCase
    }
    
    func viewDidLoad() {
        popularMoviesUseCase.displayPopularMovies { (result) in
            switch result {
            case let .success(movies):
                self.dataSource = movies
                break
            case let .failure(error):
                break
            }
        }
    }
}
