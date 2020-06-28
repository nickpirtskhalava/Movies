//
//  Movie.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation



struct Movie {
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let posterPath: String
    let id: Int
    let adult: Bool
    let backdropPath, originalLanguage, originalTitle: String
    let genreIDS: [Int]
    let title: String
    let voteAverage: Double
    let overview, releaseDate: String
}


extension Movie {
    
    var viewModel: MovieCellViewModel {
        return MovieCellViewModel.init(
            imageUrl: "\(AppUrl.ImagePath)\(posterPath)",
            movieName: originalTitle)
    }
}
