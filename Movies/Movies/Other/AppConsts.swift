//
//  AppConsts.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

enum MovieType: String {
    case topRated = "top_rated"
    case popular = "popular"
    case favorite = "favorite"
}

extension MovieType {
    var request: ApiRequest {
        switch self {
        case .popular:
            return ApiPopularMoviesRequest()
        default:
            return ApiTopRatedMoviesRequest()
        }
    }
}

struct AppConsts {

    struct Filter {
        static let title = "Filter"
        static let message = ""
    }
    
    struct AlertAction {
        static let popular = "Popular"
        static let topRated = "Top Rated"
        static let favorite = "Favorite"
        static let cancel = "Cancel"
    }
}
