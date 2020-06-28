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
    
    private let popularMoviesUseCase: DisplayPopularMoviesUseCase
    
    init(useCase: DisplayPopularMoviesUseCase) {
        self.popularMoviesUseCase = useCase
    }
    
    func viewDidLoad() {
        
        popularMoviesUseCase.displayPopularMovies { (result) in
            
        }
    }
}
