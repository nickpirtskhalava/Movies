//
//  AddMovie.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation


protocol AddMovieUseCase {
    func add(movie: Movie)
}

class AddMovieUseCaseImpl: AddMovieUseCase {
    
    let gateway: LocalPersistenceMoviesGateway
    init(gateway: LocalPersistenceMoviesGateway) {
        self.gateway = gateway
    }
    
    func add(movie: Movie) {
        self.gateway.add(movie: movie)
    }
}
