//
//  CoreDataMovie.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

extension CoreDataMovie {
    var movie: Movie {
        return Movie(popularity: popularity,
                     voteCount: Int(voteCount),
                     video: false,
                     posterPath: posterPath ?? "",
                     id: Int(id),
                     adult: adult,
                     backdropPath: backdropPath ?? "",
                     originalLanguage: originalLanguage ?? "",
                     originalTitle: originalTitle ?? "",
                     genreIDS: [],
                     title: title ?? "",
                     voteAverage: voteAverage,
                     overview: overview ?? "",
                     releaseDate: releaseDate ?? "")
    }
    
    
    func populate(with movie: Movie) {
        popularity = movie.popularity
        voteCount = Int32(movie.voteCount)
        posterPath = movie.posterPath
        id = Int32(movie.id)
        adult = movie.adult
        backdropPath = movie.backdropPath
        originalLanguage = movie.originalLanguage
        originalTitle = movie.originalTitle
        title = movie.title
        voteAverage = movie.voteAverage
        overview = movie.overview
        releaseDate = movie.releaseDate
    }
}
