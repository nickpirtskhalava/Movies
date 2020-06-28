//
//  ApiMovie.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

struct ApiMovie: Codable {
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

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}

extension ApiMovie {
    var movie: Movie {
        return Movie(
            popularity: popularity,
            voteCount: voteCount,
            video: video,
            posterPath: posterPath,
            id: id,
            adult: adult,
            backdropPath: backdropPath,
            originalLanguage: originalLanguage,
            originalTitle: originalTitle,
            genreIDS: genreIDS,
            title: title,
            voteAverage: voteAverage,
            overview: overview,
            releaseDate: releaseDate)
    }
}
