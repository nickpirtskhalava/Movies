//
//  MoviesCollectionPresenter.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/27/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

protocol MoviesView: class {
    func reloadData()
}

protocol MovieCollectionPresenter {
    var  numberOfMovies: Int { get }
    func viewDidLoad()
    func configure(cell: MovieCollectionCell, forRow row: Int)
}

class MovieCollectionPresenterImpl: MovieCollectionPresenter {
    
    fileprivate let popularMoviesUseCase: DisplayPopularMoviesUseCase
    fileprivate weak var view: MoviesView?
    fileprivate var dataSource: [Movie] = []
    
    var numberOfMovies: Int {
        return dataSource.count
    }
    
    init(view: MoviesView?,
         useCase: DisplayPopularMoviesUseCase) {
        self.popularMoviesUseCase = useCase
        self.view = view
    }
    
    func viewDidLoad() {
        popularMoviesUseCase.displayPopularMovies { (result) in
            switch result {
            case let .success(movies):
                self.dataSource = movies
                self.view?.reloadData()
                break
            case let .failure(error):
                break
            }
        }
    }
    
    func configure(cell: MovieCollectionCell, forRow row: Int) {
        let movie = dataSource[row]
        let model = movie.viewModel
        cell.configure(with: model)
    }
}
