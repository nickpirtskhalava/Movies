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

    
}
